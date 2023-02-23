package main

import (
	"fmt"
	"gvb_server/core"
	"gvb_server/global"
	"gvb_server/service/redis_ser"
)

func main() {
	// 读取配置文件
	core.InitConf()
	// 初始化日志
	global.Log = core.InitLogger()

	global.Redis = core.ConnectRedis()

	redis_ser.Digg("MI4aeYYB6uoytGZAtrHU")
	fmt.Println(redis_ser.GetDigg("MI4aeYYB6uoytGZAtrHU"))

	fmt.Println(redis_ser.GetDiggInfo())
	//redis_ser.DiggClear()
}
