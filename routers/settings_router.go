package routers

import (
	"gvb_server/api"
	"gvb_server/middleware"

	"github.com/gin-gonic/gin"
)

// handler 处理器，用于处理 HTTP 请求。在典型的 MVC 架构中也被叫做控制器的动作（action in controller）。
// 形式非常简单，就是一个可以接收 *gin.Context类型 参数的函数即可。
// // HandlerFunc defines the handler used by gin middleware as return value.
// type gin.HandlerFunc func(*gin.Context)
// 处理器分为两类，中间件和请求处理器（业务逻辑处理器）。
// 处理器被调用时，会接收一个 *Context 参数，是请求上下文，我们用于获取请求和操作响应。

func (router RouterGroup) SettingsRouter() {
	settingsApi := api.ApiGroupApp.SettingsApi
	router.GET("settings/site", settingsApi.SettingsSiteInfoView)
	router.PUT("settings/site", middleware.JwtAdmin(), settingsApi.SettingsSiteUpdateView)
	router.GET("settings/:name", middleware.JwtAdmin(), settingsApi.SettingsInfoView)
	router.PUT("settings/:name", middleware.JwtAdmin(), settingsApi.SettingsInfoUpdateView)
}

// 路由分组方式二  测试
func SettingsRouter_2(router *gin.RouterGroup) {
	settingsApi := api.ApiGroupApp.SettingsApi
	router.GET("settings/site_test", settingsApi.SettingsSiteInfoView_2)
}
