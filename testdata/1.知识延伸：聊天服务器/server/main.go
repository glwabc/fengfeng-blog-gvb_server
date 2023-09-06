package main

import (
	"bufio"
	"fmt"
	"log"
	"net"
	"os"
	"strings"
	"time"
)

func main() {
	listener, err := net.Listen("tcp", ":8000")
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println("服务器开始监听……")
	go broadcaster()
	for {
		conn, err := listener.Accept()
		if err != nil {
			log.Print(err)
			continue
		}
		go handleConn(conn)
	}
}

// 广播器
// 只能读取数据的通道类型为  <-chan
// 只能写入数据的通道类型为  chan<-
type client chan<- string // 对外发送消息的通道
type clientInfo struct {
	name string
	ch   client
}

var (
	entering = make(chan clientInfo)
	leaving  = make(chan clientInfo)
	messages = make(chan string) // 所有接受的客户消息
)

// 通道类型：初始值为nil，用make完成初始化
// nil通道上的读写永远阻塞。当case上读一个通道时，如果这个通道是nil，则该case永远阻塞。
// 可以将某个channel设置为nil，进行强制阻塞，对于select分支来说，就是强制禁用此分支。
// 这个功能有1个妙用，select通常处理的是多个通道，当某个读通道关闭了，
// 但不想select再继续关注此case，继续处理其他case，把该通道设置为nil即可。

type registeInfo struct {
	name string
	ch   chan<- bool
}

var register = make(chan registeInfo) // 注册用户名的通道

func broadcaster() {
	clients := make(map[string]client) // 所有连接的客户端集合
	for {
		// 通过select可以监听channel上的数据流动
		// golang 的 select 的功能就是监听 IO 操作，当 IO 操作发生时，触发相应的动作。
		// select 的 case 里的操作语句只能是【IO 操作】
		// 监听的case中,没有满足条件的就阻塞
		// 多个满足条件的就任选一个执行
		// 如果select语句发现同时有多个候选分支满足选择条件，那么它就会用一种伪随机的算法在这些分支中选择一个并执行。
		// select本身不带循环,需要外层的for
		// break只能跳出select中的一个case
		// 加入了默认分支，那么无论涉及通道操作的表达式是否有阻塞，select语句都不会被阻塞。
		// 如果那几个表达式都阻塞了，或者说都没有满足求值的条件，那么默认分支就会被选中并执行。
		// 如果没有加入默认分支，那么一旦所有的case表达式都没有满足求值条件，那么select语句就
		// 会被阻塞。直到至少有一个case表达式满足条件为止。
		select {
		case msg := <-messages:
			// 把所有接收的消息广播给所有的客户
			// 发送消息通道
			for name, cli := range clients {
				select {
				case cli <- msg:
				default:
					fmt.Fprintf(os.Stderr, "send message failed: %s: %s\n", name, msg)
				}
			}
		case user := <-register:
			// 先判断新用户名是否有重复
			_, ok := clients[user.name]
			user.ch <- !ok
		case cliSt := <-entering:
			// 在每一个新用户到来的时候，通知当前存在的用户
			var users []string
			for user := range clients {
				users = append(users, user)
			}
			if len(users) > 0 {
				cliSt.ch <- fmt.Sprintf("Other users in room: %s", strings.Join(users, "; "))
			} else {
				cliSt.ch <- "You are the only user in this room."
			}

			clients[cliSt.name] = cliSt.ch
		case cliSt := <-leaving:
			delete(clients, cliSt.name)
			close(cliSt.ch)
		}
	}
}

// 客户端处理函数
func handleConn(conn net.Conn) {
	defer conn.Close() // 退出时关闭客户端连接，现在有分支了，并且可能会提前退出

	who, ok := clientRegiste(conn) // 注册获取用户名
	if !ok {                       // 用户名未注册成功
		fmt.Fprintln(conn, "\r\nName registe failed...")
		return
	}

	ch := make(chan string, 10) // 有缓冲区，对外发送客户消息的通道
	go clientWriter(conn, ch)

	cli := clientInfo{who, ch}       // 打包好用户名和通道
	ch <- "You are " + who           // 这条单发给自己
	messages <- who + " has arrived" // 现在这条广播自己也能收到
	entering <- cli

	inputFunc := func(sig chan<- struct{}) {
		input := bufio.NewScanner(conn)
		for input.Scan() {
			sig <- struct{}{}                              // 向 sig 发送信号，会重新开始计时
			if len(strings.TrimSpace(input.Text())) == 0 { // 禁止发送纯空白字符
				continue
			}
			messages <- who + ": " + input.Text()
		}
		// 注意，忽略input.Err()中可能的错误
	}
	inputWithTimeout(conn, 300*time.Second, inputFunc)

	leaving <- cli
	messages <- who + " has left"
}

func clientWriter(conn net.Conn, ch <-chan string) {
	for msg := range ch {
		// windows 需要 \r 了正常显示
		fmt.Fprintln(conn, msg+"\r") // 注意，忽略网络层面的错误
	}
}

// 注册用户名
func clientRegiste(conn net.Conn) (who string, ok bool) {
	inputFunc := func(sig chan<- struct{}) {
		input := bufio.NewScanner(conn)
		ch := make(chan bool)
		fmt.Fprint(conn, "input nickname: ") // 注意，忽略网络层面的错误
		for input.Scan() {
			if len(strings.TrimSpace(input.Text())) == 0 { // 禁止发送纯空白字符
				continue
			}
			who = input.Text()
			register <- registeInfo{who, ch}
			if <-ch {
				ok = true
				break
			}
			fmt.Fprintf(conn, "name %q is existed\r\ntry other name: ", who)
		}
		// 注意，忽略input.Err()中可能的错误
	}
	inputWithTimeout(conn, 15*time.Second, inputFunc)
	return who, ok
}

// 为 input.Scan 封装超时退出的功能
func inputWithTimeout(conn net.Conn, timeout time.Duration, input func(sig chan<- struct{})) {
	done := make(chan struct{}, 2)
	inputSignal := make(chan struct{})
	go func() {
		timer := time.NewTimer(timeout)
		for {
			select {
			case <-inputSignal:
				timer.Reset(timeout)
			case <-timer.C:
				// 超时，断开连接
				done <- struct{}{}
				return
			}
		}
	}()

	go func() {
		input(inputSignal)
		done <- struct{}{}
	}()

	<-done
}
