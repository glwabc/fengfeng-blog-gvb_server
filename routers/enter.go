package routers

import (
	"gvb_server/global"
	"net/http"

	"github.com/gin-gonic/gin"
	swaggerFiles "github.com/swaggo/files"
	gs "github.com/swaggo/gin-swagger"
)

type RouterGroup struct {
	*gin.RouterGroup // 结构体嵌套，实现继承的效果
}

func InitRouter() *gin.Engine {
	// 设置成开发模式：
	// gin.SetMode(gin.DebugMode)
	// 设置成生产环境模式
	// gin.SetMode(gin.ReleaseMode)
	// 设置成测试环境模式
	// gin.SetMode(gin.TestMode)
	// 		DebugMode = "debug"
	// 		ReleaseMode = "release"
	// 		TestMode = "test"
	// 如果项目要发布上线，切记切换到生产环境模式
	// gin开发模式如果不做设置，默认是 degbug模式，此时控制台会输出信息，提示我们设置环境变量或在代码中设置成生产模式
	gin.SetMode(global.Config.System.Env)
	// gin.Default()返回一个已连接记录器和恢复中间件的引擎实例，即Logger 和 Recovery 中间件，
	// 我们在这里可以看到gin.Default本质上就是调用了gin.New，然后再Use Logger 和 Recovery这两个中间件
	// 		r := gin.Default()
	//      ====>
	// 		r := gin.New()
	// 		r.Use(gin.Logger(), gin.Recovery())
	router := gin.Default()

	// 静态资源加载
	// 一般网站开发中，我们会考虑把 js，css，以及资源图片放在一起，作为静态站点部署在 CDN，提升响应速度。   // ？？？
	// router.Static 指定某个目录为静态资源目录，可直接访问这个目录下的资源，url 要具体到资源名称。
	// router.StaticFS 比前面一个多了个功能，当目录下不存 index.html 文件时，会列出该目录下的所有文件。
	// router.StaticFile 指定某个具体的文件作为静态资源访问。
	// StaticFile 是加载单个文件，而 StaticFS 是加载一个完整的目录资源
	// 示例：
	// 	   router.Static("/assets", "./assets")
	//     router.StaticFS("/more_static", http.Dir("my_file_system"))
	//     router.StaticFile("/favicon.ico", "./resources/favicon.ico")
	// StaticFS 是加载⽬录下⾯所有内容。第一个参数时api，第⼆个变量填写静态资源存放的相对路径。
	//
	// StaticFS(relativePath string, fs http.FileSystem)
	// FileSystem是个interface, 而http.Dir实现了FileSystem
	// type Dir string
	// http.Dir("/public")可以认为是类型转换，不是函数
	// http.Dir("/public")是利用本地tmp目录实现一个文件系统
	router.StaticFS("uploads", http.Dir("uploads"))

	// r.GET("/user/:name", func(c *gin.Context) {
	// 	name := c.Param("name")
	// 	c.String(http.StatusOK, "Hello %s", name)
	// })
	// r.GET("/user/:name/*action", func(c *gin.Context) {
	// 	name := c.Param("name")
	// 	action := c.Param("action")
	// 	message := name + " is " + action
	//  // func (c *Context) String(code int, format string, values ...interface{})
	// 	c.String(http.StatusOK, message)
	// })
	// 方式一 中：
	// 	此 handler 将匹配 /user/john 但不会匹配 /user/ 或者 /user
	// 方式二 中：
	// 	此 handler 将匹配 /user/john/ 和 /user/john/send
	// 	如果没有其他路由匹配 /user/john，它将重定向到 /user/john/
	// 1、：冒号是必选的意思
	// 2、*号是可选的意思
	// 匹配单节点 named
	// pattern = /book/:id
	//     match /book/123
	//        nomatch /book/123/10
	//        nomatch /book/
	// 匹配子节点 catchAll mode
	//           /book/*subpath
	//     match /book/
	//     match /book/123
	//     match /book/123/10
	router.GET("/swagger/*any", gs.WrapHandler(swaggerFiles.Handler))
	// 嵌套结构体是 Golang 中实现继承的一种方式。我们可以在一个结构体中嵌套另一个结构体，
	// 这样嵌套的结构体就可以继承嵌套在其中的结构体的所有属性和方法。
	// type gin.Engine struct {
	// 		RouterGroup
	// 		……
	// }
	// Engine 结构体继承了 RouterGroup ，所以 Engine 直接具备了 RouterGroup 所有的路由管理功能。
	// 同时 RouteGroup 对象里面还会包含一个 Engine 的指针，这样 Engine 和 RouteGroup 就成了「你中有我我中有你」的关系。
	// type RouterGroup struct {
	// 		engine   *Engine
	// 		……
	// }
	apiRouterGroup := router.Group("api")

	routerGroupApp := RouterGroup{apiRouterGroup}
	// 系统配置api   通过 结构体的不同方法 实现路由分组
	routerGroupApp.SettingsRouter()
	// 方式二 将 路由分组实例 传输到 路由函数 中去  测试  api/settings/site_test
	SettingsRouter_2(apiRouterGroup)
	routerGroupApp.ImagesRouter()
	routerGroupApp.AdvertRouter()
	routerGroupApp.MenuRouter()
	routerGroupApp.UserRouter()
	routerGroupApp.TagRouter()
	routerGroupApp.MessageRouter()
	routerGroupApp.ArticleRouter()
	routerGroupApp.CommentRouter()
	routerGroupApp.NewsRouter()
	routerGroupApp.ChatRouter()
	routerGroupApp.LogRouter()
	routerGroupApp.DataRouter()
	return router
}

// 路由分组 方式二：
// router := gin.Default()
// v1 := router.Group("/v1")
// {
// 	  v1.POST("/login", loginEndpoint)
// 	  v1.POST("/submit", submitEndpoint)
// 	  v1.POST("/read", readEndpoint)
// }

// v2 := router.Group("/v2")
// {
// 	  v2.POST("/login", loginEndpoint)
// 	  v2.POST("/submit", submitEndpoint)
// 	  v2.POST("/read", readEndpoint)
// }
