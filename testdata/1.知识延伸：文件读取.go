package main

import (
	"bufio"
	"fmt"
	"io"
	"io/ioutil"
	"os"
	"strings"
)

// 整个文件读入内存
// 直接将数据直接读取入内存，是效率最高的一种方式，但此种方式，仅适用于小文件，对于大文件，则不适合，因为比较浪费内存

// 在 Go 1.16 开始，ioutil.ReadFile 就等价于 os.ReadFile，二者是完全一致的

func main() {
	fmt.Println("====================(一)=======================")
	// （一）使用os.ReadFile函数读取文件  整个文件读入内存

	// func os.ReadFile(name string) ([]byte, error)
	content, err := os.ReadFile("testdata\\1.错误码读取.go") // 需要 \\ 转义
	if err != nil {
		panic(err)
	}
	// 内容输出
	fmt.Println(string(content))

	fmt.Println("====================(二)=======================")
	// （二）使用os.Open/OpenFile函数只读形式获取句柄  先创建句柄再读取

	// func os.Open(name string) (*os.File, error)
	// Open是一个高级函数，是因为它是只读模式来打开文件
	// 也可以直接使用 os.OpenFile，只是要多加两个参数
	// func os.OpenFile(name string, flag int, perm fs.FileMode) (*os.File, error)
	// 		file, err := os.OpenFile("a.txt", os.O_RDONLY, 0)
	file, err := os.Open("models\\res\\err_code.go")
	if err != nil {
		panic(err)
	}
	// func (*os.File).Close() error
	defer file.Close()
	// func ioutil.ReadAll(r io.Reader) ([]byte, error) {
	// 		return io.ReadAll(r)
	// }
	// ioutil.ReadAll 主要的作用是从一个 io.Reader 中读取 所有 数据到内存，直到结尾。
	// 函数 ReadAll 首先创建了 512 bytes 的切片 b。接着循环读取数据流到 b。其中，当 b 切片满的时候，
	// 调用 append 为 b 扩容，再继续读取。可以想见这种机制，当读取大文件时频繁的扩容，大文件写入到内
	// 存中会导致时间消耗，更甚者导致程序被 OOM kill 掉。
	// 如果待拷贝数据的容量小于 512 字节的话，性能不受影响。但如果超过 512 字节，就会开始切片扩容。
	// 数据量越大，扩容越频繁，性能受影响越大。
	// 如果是大的文件的话，可能会出现内存不足的问题
	content2, err := ioutil.ReadAll(file)
	// 内容输出
	fmt.Println(string(content2))

	// io.Copy 函数不会一次性读取全部数据，也不会频繁进行切片扩容，显然在数据量大时是更好的选择。
	// io.copy(dst,src)从src读,写入dst中.
	// 它就是在文件指针之间直接复制的，不用全读入内存，可解决这样的问题。
	// 它是将源复制到目标，并且是按默认的缓冲区32k循环操作的，不会将内容一次性全写入内存中,这样就能解决大文件的问题。
	/*
					// 打开源文件
				    srcFile, err := os.Open("source.txt")
				    if err != nil {
				        panic(err)
				    }
				    defer srcFile.Close()

				    // 创建目标文件
				    dstFile, err := os.Create("destination.txt")
				    if err != nil {
				        panic(err)
				    }
				    defer dstFile.Close()

				    // 拷贝文件内容
				    _, err = io.Copy(dstFile, srcFile)
				    if err != nil {
				        panic(err)
				    }

					// 限制拷贝的字节数const limit = 1024 * 1024 // 限制拷贝的字节数为1MB
					// 使用io.LimitReader()函数来限制只拷贝source.txt文件的前1MB数据。
					_, err = io.CopyN(dstFile, io.LimitReader(srcFile, limit), limit)
					if err != nil {
		    			panic(err)
					}
	*/

	fmt.Println("====================(三)=======================")
	// (三)bufio.ReadBytes和bufio.ReadString 读取单行数据

	// ReadBytes读取直到第一次遇到delim字节，返回一个包含已读取的数据和delim字节的切片。
	// (ReadString读取直到第一次遇到delim字节，返回一个包含已读取的数据和delim字节的字符串。)
	// 如果ReadBytes方法在读取到delim之前遇到了错误，它会返回在错误之前读取的数据以及该
	// 错误（一般是io.EOF）。当且仅当ReadBytes方法返回的切片不以delim结尾时，会返回一个
	// 非nil的错误
	// 创建句柄
	fi, err := os.Open("models\\res\\err_code.go")
	if err != nil {
		panic(err)
	}
	// func bufio.NewReader(rd io.Reader) *bufio.Reader，返回的是bufio.Reader结构体
	r := bufio.NewReader(fi) // 创建 bufio.Reader

	for {
		// func (*bufio.Reader).ReadBytes(delim byte) ([]byte, error)
		lineBytes, err := r.ReadBytes('\n')
		// // func (*bufio.Reader).ReadString(delim byte) (string, error)
		// line, err := r.ReadString('\n')
		//去掉字符串首尾空白字符，返回字符串
		line := strings.TrimSpace(string(lineBytes))

		if err != nil && err != io.EOF {
			panic(err)
		}
		if err == io.EOF {
			break
		}
		fmt.Println(line)
	}

	fmt.Println("====================(四)=======================")
	// (四)每次只读取固定字节数

	// 每次仅读取一行数据，可以解决内存占用过大的问题，但要注意的是，并不是所有的文件都有换行符 \n;
	// 因此对于一些不换行的大文件来说，还得再想想其他办法
	// 通用的做法是：
	// 		先创建一个文件句柄，可以使用 os.Open 或者 os.OpenFile；
	// 		然后 bufio.NewReader 创建一个 Reader；
	// 		然后在 for 循环里调用 Reader 的 Read 函数，每次仅读取固定字节数量的数据

	// 创建句柄
	// fi2, err := os.Open("models\\advert_model.go")  // ok  需要\\ 转义
	fi2, err := os.Open("models/advert_model.go") // ok
	if err != nil {
		panic(err)
	}

	// 创建 Reader
	r2 := bufio.NewReader(fi2)

	// 每次读取 1024 个字节
	buf := make([]byte, 1024)
	for {
		// func (*bufio.Reader).Read(p []byte) (n int, err error)
		// Read方法读取数据写入p；本方法返回写入p的字节数；本方法一次调用最多会调用下层Reader接口的一次Read方法，
		// 因此返回值n可能小于len；读取到达结尾时，返回值n将为0而err将为io.EOF
		n, err := r2.Read(buf)
		if err != nil && err != io.EOF {
			panic(err)
		}
		if n == 0 { // err == io.EOF
			break
		}
		fmt.Println(string(buf[:n]))
	}

}
