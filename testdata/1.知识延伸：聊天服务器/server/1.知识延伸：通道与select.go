// var ch chan int //ch为nil
package main

import (
	"fmt"
	"runtime"
	"time"
)

func main() {
	// chan类型的空置是nil，声明后需要配合make才能使用。
	// channel是引用类型，需要使用make进行创建
	//
	// channel默认是阻塞的。
	// 当数据被发送到channel时会发生阻塞，直到有其他Goroutine从该channel中读取数据。
	// 当从channel读取数据时，读取也会被阻塞，直到其他Goroutine将数据写入该channel。
	// 这些channel的特性是帮助Goroutines有效地通信，而不需要使用其他语言中的显式锁或条件变量。
	//
	// 阻塞接收数据
	// 		data := <-ch   // 执行该语句时将会阻塞，直到接收到数据并赋值给data变量。
	// 阻塞接收数据的完整写法
	// 		data, ok := <-ch
	// data 表示接收到的数据。未接收到数据时，data为channel类型的零值。
	// ok表示是否接收到数据。通过ok值可以判断当前channel是否被关闭。
	// 通道接收的返回值有两个，第二个返回值的类型是bool类型。值为false说明通道已经关闭。
	// 对关闭的通道进行发送操作，就会引发 panic。
	// 关闭已经关闭的通道，也会引发 panic。
	// 注意：
	// 如果通道关闭时，里面还有元素值未被取出，那么接收表达式的第一个结果，
	// 仍会是通道中的某一个元素值，而第二个结果值一定会是true。
	// 所以，通过接收表达式的第二个返回值，来判断通道是否关闭是可能有延时的。
	// 结论: 不要让接收方关闭通道，而应该让发送方关闭通道，接受方判断通道是否关闭。
	//
	// 默认创建的都是非缓冲channel，读写都是即时阻塞。
	// 缓冲channel自带一块缓冲区，可以暂时存储数据，如果缓冲区满了，就会发生阻塞。
	// 演示：让接收方关闭通道
	ch1 := make(chan int, 2)
	// 发送方。
	go func() {
		for i := 0; i < 10; i++ {
			fmt.Printf("Sender: sending element %v...\n", i)
			ch1 <- i
		}
		fmt.Println("Sender: close the channel...")
		close(ch1) // 关闭通道
	}()

	// 接收方。
	for {
		elem, ok := <-ch1
		// 使用 ok 变量来判断通道是否关闭
		if !ok {
			fmt.Println("Receiver: closed channel")
			fmt.Println("关闭时候读取的通道元素：", elem)
			// 关闭时候读取的通道元素： 0
			break
		}
		fmt.Printf("Receiver: received an element: %v\n", elem)
	}

	fmt.Println("演示：让接收方关闭通道   End.")

	// =====================================================

	// 使用select来设置 防止channel超时机制  方式一
	cc := make(chan int)
	o := make(chan bool)
	go func() {
		for {
			select {
			case v := <-cc:
				fmt.Println(v)
			//5秒钟自动关闭,避免长时间超时
			case <-time.After(5 * time.Second):
				fmt.Println("timeout  方式一")
				o <- true
				break
			}
		}
	}()
	//有值就主协程走,主协程走完就都没了
	<-o
	fmt.Println("防止chan超时机制 方式一 程序结束")

	// =====================================================

	// 使用 select 实现 timeout 机制  方式二

	timeout := make(chan bool, 1)
	go func() {
		time.Sleep(3e9) // sleep three second  // Nanosecond  Duration = 1
		timeout <- true
	}()
	ch2 := make(chan int)
	fmt.Println("堵塞三秒！")
	select {
	case <-ch2:
	case <-timeout:
		fmt.Println("timeout!  方式二")
	}
	// =====================================================

	// 超时这种写法也常常用来设置定时执行某段函数
	// go func() {
	fmt.Println("定时3秒后执行程序")
	select {
	case <-time.After(3 * time.Second):
		fmt.Println("3秒到了，执行程序：dosometing()")
	}
	// }()

	// =====================================================
	// 利用 default 特性， 我们可以使用 select 语句来检测 chan 是否已经满了。
	ch3 := make(chan int, 1)
	ch3 <- 1
	select {
	case ch3 <- 2:
	default:
		fmt.Println("channel ch3 is full !")
	}

	// =====================================================

	// channel初始化的值以及堵塞

	fmt.Println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^")

	var ch chan int
	fmt.Printf("通道声明后的值：%#v\n", ch)
	// 通道声明后的值：(chan int)(nil)

	// g1
	// ch声明后为nil，在g1中被初始化为缓冲区大小为1的通道，g1向ch写数据后退出；
	go func() {
		ch = make(chan int, 1)
		fmt.Printf("通道make后的值：%#v\n", ch)
		// 通道make后的值：(chan int)(0xc0000201c0)
		ch <- 1
		fmt.Printf("写入数据后，通道的值：%#v\n", ch)
		// 写入数据后，通道的值：(chan int)(0xc0000201c0)
	}()

	//g2
	// 通过参数把ch传递给g2时，ch还是nil，所以在g2内部ch为nil，从nil的通道读数据会阻塞，所以g2无法退出
	// 对于值为nil的通道，不论它的具体类型是什么，对它的发送操作和接收操作都会永久地处于阻塞状态。
	// 它们所属的 goroutine 中的任何代码，都不再会被执行。
	// 注意，由于通道类型是引用类型，所以它的零值就是nil。换句话说，当我们只声明该类型的变量
	// 但没有用make函数对它进行初始化时，该变量的值就会是nil。我们一定不要忘记初始化通道！
	go func(ch chan int) {
		fmt.Printf("g2 中通道ch的值：%#v\n", ch)
		// g2 中通道ch的值：(chan int)(nil)

		time.Sleep(time.Second)
		<-ch // 接收任意数据，忽略接收的数据
	}(ch)

	c := time.Tick(1 * time.Second)
	// Tick()函数是NewTicker函数的实用程序包装。它仅允许访问时间通道。
	// 如果指定的持续时间小于或等于0，则Tick方法返回nil，并报错
	// 写法一
	for range c { // 这种写法即不接收遍历值
		fmt.Printf("#goroutines: %d\n", runtime.NumGoroutine())
		// Main协程不会退出，会持续遍历通道c，定时器的通道并不统计在NumGoroutine中，所以会打印存在2个goroutine。
	}

	// 普通for循环接收channel数据，需要有break循环的条件；for range会自动判断出channel已关闭，而无需通过判断来终止循环。

	// 写法二
	for tick := range c {
		fmt.Printf("#goroutines: %d -- %v\n", runtime.NumGoroutine(), tick)
	}
}
