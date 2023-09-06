package flag

import (
	sys_flag "flag"
	"gvb_server/core"
	"gvb_server/global"

	"github.com/fatih/structs"
)

type Option struct {
	DB   bool
	User string // -u admin  -u user
	ES   bool   // -es create  -es delete
	Dump string
	Load string
}

// Parse 解析命令行参数
func Parse() Option {
	db := sys_flag.Bool("db", false, "初始化数据库")
	// flag.Bool()函数可以创建一个新的bool类型命令行参数。
	// name：  一个字符串，指定用于标志的名称。
	// value： 一个布尔值，指定标志要使用的默认值。
	// usage： 一个字符串，指定要显示的用法或帮助消息。
	// 返回值：它返回布尔变量的地址，该变量存储定义的标志的值。
	user := sys_flag.String("u", "", "创建用户")
	es := sys_flag.Bool("es", false, "es操作")
	dump := sys_flag.String("dump", "", "将索引下的数据导出为json文件")
	load := sys_flag.String("load", "", "导入json数据，并创建索引")
	// 解析命令行参数写入注册的flag里   把用户传递的命令行参数解析为对应变量的值
	// 必须要执行 flag.Parse() 才能解析命令行
	// 返回的是指针，访问需使用*
	sys_flag.Parse()
	return Option{
		DB:   *db,
		User: *user,
		ES:   *es,
		Dump: *dump,
		Load: *load,
	}
}

// 支持的命令行参数格式有以下几种：
// -flag     只支持 bool 类型；
// -flag=x   支持所有类型
// -flag x   只支持非 bool 类型。
// 		flag.StringVar 用于指定参数的值存储在一个字符串变量中，而 flag.String 则直接返回参数的值。
// 		var foo string
// 		flag.StringVar(&foo, "foo", "default", "this is foo")
// 		foo := flag.String("foo", "default", "this is foo")
//
// 定义命令行参数对应的变量，这四个变量都是指针类型
// var cliName = flag.String("name", "John", "Input Your Name")
// var cliAge = flag.Int("age", 22, "Input Your Age")
// var cliGender = flag.String("gender", "male", "Input Your Gender")
// var cliPeriod = flag.Duration("period", 1*time.Second, "sleep period")

// var cliFlag int
// flag.IntVar(&cliFlag, "flagname", 1234, "Just for demo")
// // flag.Args() 函数返回没有被解析的命令行参数
// // flag.NArg() 函数返回没有被解析的命令行参数的个数
// fmt.Printf("args=%s, num=%d\n", flag.Args(), flag.NArg())
// for i := 0; i != flag.NArg(); i++ {
//     fmt.Printf("arg[%d]=%s\n", i, flag.Arg(i))
// }
// // 输出命令行参数
// fmt.Println("name=", *cliName)
// fmt.Println("age=", *cliAge)
// fmt.Println("gender=", *cliGender)
// fmt.Printf("period=", *cliPeriod)

// IsWebStop 是否停止web项目
func IsWebStop(option Option) (f bool) {
	// func structs.Map(s interface{}) map[string]interface{}
	// Map converts the given struct to a map[string]interface{}.
	// For more info refer to Struct types Map() method. It panics if s's kind is not struct.
	maps := structs.Map(&option)
	for _, v := range maps {
		switch val := v.(type) {
		case string:
			if val != "" {
				f = true
			}
		case bool:
			if val == true {
				f = true
			}
		}
	}
	return f
}

/*
package main

//
// 主要用于 struct 转 map
// 还可以判断结构体是否有空属性等功能
//

import (
	"fmt"
	"github.com/fatih/structs"
)

// struct --> map

type Stu struct {
	Name string
	Age  int
}

func main() {
	// 创建一个 Age 属性为空的 struct 实例
	u1 := Stu{
		Name: "Tim",
	}

	var u2 Stu

	// 判断是否为结构体
	isStruct := structs.IsStruct(u1)
	fmt.Println(isStruct)

	// 判断 struct 是否为空 --> false
	isZero := structs.IsZero(u2)
	fmt.Println(isZero)

	// 是否有空属性 --> true
	hasZero := structs.HasZero(u1)
	fmt.Println(hasZero)

	// 获取 structName  --> Stu
	structName := structs.Name(u1)
	fmt.Println(structName)

	// 获取 struct 所有属性名 --> [Name Age]
	names := structs.Names(u1)
	fmt.Println(names)

	// 获得 属性对应的值 --> [Tim 0]
	values := structs.Values(u1)
	fmt.Println(values)

	// 转成 map
	m := structs.Map(u1)
	for _, v := range m {
		fmt.Printf("%T , %[1]v\n", v)
	}
}
*/

// SwitchOption 根据命令执行不同的函数
func SwitchOption(option Option) {
	if option.DB {
		Makemigrations()
		return
	}
	if option.User == "admin" || option.User == "user" {
		CreateUser(option.User)
		return
	}
	if option.ES {
		global.ESClient = core.EsConnect()
		if option.Dump != "" {
			DumpIndex(option.Dump)
		}
		if option.Load != "" {
			LoadIndex(option.Load)
		}
	}
}
