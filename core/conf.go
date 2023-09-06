package core

import (
	"fmt"
	"gvb_server/config"
	"gvb_server/global"
	"io/fs"
	"log"
	"os"

	"gopkg.in/yaml.v2"
)

const ConfigFile = "settings.yaml"

// InitConf 读取yaml文件的配置
func InitConf() {
	c := &config.Config{}
	// ioutil.ReadFile，适用于文件比较小的读入，将整个文件的操作都封装到整个函数中去了。
	// 从 Go 语言 1.16 开始，ioutil.ReadAll、ioutil.ReadFile 和 ioutil.ReadDir 被弃用，因为 io/ioutil 包被弃用。
	// 		ioutil.ReadAll -> io.ReadAll
	// 		ioutil.ReadFile -> os.ReadFile
	// 		ioutil.ReadDir -> os.ReadDir
	// 		ioutil.WriteFile -> os.WriteFile
	// // func ioutil.ReadFile(filename string) ([]byte, error)
	// yamlConf, err := ioutil.ReadFile(ConfigFile)
	// func os.ReadFile(name string) ([]byte, error)
	yamlConf, err := os.ReadFile(ConfigFile)
	// //把读取到的内容显示到终端
	// fmt.Printf("yamlConf:\n%v\n", yamlConf)                 //[]byte
	// fmt.Printf("string(yamlConf):\n%v\n", string(yamlConf)) //转成string，就输出的是具体的内容
	// //因为没有Open文件，因此也不需要close文件
	// //文件的open和close被封装到Readfile函数内部了
	if err != nil {
		panic(fmt.Errorf("get yamlConf error: %s", err))
	}
	// yaml.Unmarshal函数将yaml文件解析为Person结构体
	err = yaml.Unmarshal(yamlConf, c)
	// fmt.Printf("读取yamlConf:%+v\n", c)   // yaml.Unmarshal不会解析注释内容
	if err != nil {
		log.Fatalf("config Init Unmarshal error: %v", err)
		// log.Fatal/Fatalf/Fatalln接口，会将日志内容打印输出，接着调用系统的os.Exit(1)接口，强制退出程序并返回状态1，
		// 有一点需要注意的是，由于直接调用系统os接口退出，defer函数不会调用。
		// 		defer fmt.Println("defer函数不会调用。。。")       // 不执行
		// 		log.Print("my log")
		// 		log.Fatal("my fatal")
		// 		fmt.Println("运行结束。。。")  // 不执行
		// 			2023/05/09 09:50:34 my log
		// 			2023/05/09 09:50:34 my fatal
		// 			exit status 1
	}
	fmt.Println("config yamlFile load Init success   1.")
	log.Print("config yamlFile load Init success   2.")
	log.Println("config yamlFile load Init success   3.")
	// config yamlFile load Init success   1.
	// 2023/07/29 19:06:42 config yamlFile load Init success   2.
	// 2023/07/29 19:06:42 config yamlFile load Init success   3.
	//
	// 现在多数情况下并不是通过某个调试器来进行debug了，而是通过打log的方式观察和调试程序。
	// log.Print和log.Println，使用起来没有什么区别，连续用log.Print，也并不会输出到同一行，还是每调用一次，就产生新的一行log。
	// log.Panic/Panicf/Panicln函数会（1）打印出日志并且（2）抛出panic异常，需要注意的是在panic之后声明的代码将不会执行。
	//		defer fmt.Println("发生了 panic错误！")              // 在panic之前的defer函数被调用并输出
	//		log.Print("my log")
	//		log.Panic("my panic")
	// 		fmt.Println("panic之后，未打印运行结束。。。")  // 此行代码不执行
	// 			2023/05/09 09:47:33 my log
	// 			2023/05/09 09:47:33 my panic
	// 			发生了 panic错误！
	// 			panic: my panic
	global.Config = c
	// 需要一个全局变量，用于保存配置文件，存放在global目录下
	// 然后在main.go中调用 InitConf读取yaml配置文件
}

func SetYaml() error {
	byteData, err := yaml.Marshal(global.Config)
	if err != nil {
		return err
	}
	// // func ioutil.WriteFile(filename string, data []byte, perm fs.FileMode) error
	// err = ioutil.WriteFile(ConfigFile, byteData, fs.ModePerm)
	// // func os.WriteFile(name string, data []byte, perm fs.FileMode) error
	err = os.WriteFile(ConfigFile, byteData, fs.ModePerm)
	if err != nil {
		return err
	}
	global.Log.Info("配置文件修改成功")
	return nil
}
