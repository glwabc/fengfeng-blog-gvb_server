package main

import (
	"gvb_server/core"
	_ "gvb_server/docs"
	"gvb_server/flag"
	"gvb_server/global"
	"gvb_server/routers"
	"gvb_server/service/cron_ser"
	"gvb_server/utils"

	"github.com/sirupsen/logrus"
)

// @title gvb_server API文档
// @version 1.0
// @description gvb_server API文档
// @host 127.0.0.1:8080
// @BasePath /
func main() {
	// 读取配置文件
	core.InitConf()
	// fmt.Println("读取yaml配置:", global.Config)
	// 初始化日志  读取配置文件之后   连接数据库之前
	global.Log = core.InitLogger()

	logrus.Warnln("警告。。。。。。告")     // 全局log 受 InitDefaultLogger() 控制
	global.Log.Warnln("警告啦啦啦啦啦啦啦") // log实例  受 InitLogger()控制
	// global.Log.Error("错误顶顶顶顶顶")
	// global.Log.Info("消息酷酷酷酷酷酷")

	// 连接数据库
	// global.DB = core.InitGorm()

	core.InitAddrDB()
	defer global.AddrDB.Close()

	// 命令行参数绑定
	option := flag.Parse()
	if flag.IsWebStop(option) {
		flag.SwitchOption(option)
		return
	}
	// 连接redis
	// global.Redis = core.ConnectRedis()
	// 连接es
	// global.ESClient = core.EsConnect()

	cron_ser.CronInit()

	router := routers.InitRouter()

	addr := global.Config.System.Addr()
	logrus.Infof("main.go----gvb_serer运行在：%s", addr)

	utils.PrintSystem()

	// gin.Run()启动http服务，默认是0.0.0.0:8080启动服务；可以跟字符串参数，自定义启动服务的端口：如":9090"
	// 实质是调用err = http.ListenAndServe(address, engine.Handler())
	err := router.Run(addr)
	if err != nil {
		global.Log.Fatalf(err.Error())
	}
}
