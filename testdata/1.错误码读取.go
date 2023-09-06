package main

import (
	"encoding/json"
	"fmt"
	"gvb_server/models/res"
	"os"

	"github.com/sirupsen/logrus"
)

// 演示:错误码信息封装在json文件中的读取

const file = "models/res/err_code.json"

type ErrMap map[res.ErrorCode]string

// type ErrMap map[int]string  // 也可以
// type ErrMap map[string]string  // 也可以运行正常

func main() {
	// func os.ReadFile(name string) ([]byte, error)
	// 在 Go 1.16 开始，ioutil.ReadFile 就等价于 os.ReadFile，二者是完全一致的
	// 直接将数据直接读取入内存，是效率最高的一种方式，但此种方式，仅适用于小文件，
	// 对于大文件，则不适合，因为比较浪费内存
	// ReadFile 读取整个文件，它不会将Read 中的EOF 视为要报告的错误。
	// ReadFile() 无需 close 文件
	// 读取与输出
	//   data, err := os.ReadFile("testdata/hello")
	//   os.Stdout.Write(data)                             // 输出方式一
	//   fmt.Printf("Contents of file: %s", string(data))  // 输出方式二
	byteData, err := os.ReadFile(file)
	if err != nil {
		logrus.Error(err)
		return
	}
	var errMap = ErrMap{}
	err = json.Unmarshal(byteData, &errMap)
	if err != nil {
		logrus.Error(err)
		return
	}
	fmt.Println(errMap)
	fmt.Printf("%#v\n", errMap)
	fmt.Println(errMap[res.SettingsError])
}
