package settings_api

import (
	"gvb_server/global"
	"gvb_server/models/res"

	"github.com/gin-gonic/gin"
)

// SettingsSiteInfoView 显示网站信息
// @Tags 系统管理
// @Summary 显示网站信息
// @Description 显示网站信息
// @Router /api/settings/site [get]
// @Produce json
// @Success 200 {object} res.Response{data=config.SiteInfo}
func (SettingsApi) SettingsSiteInfoView(c *gin.Context) {
	res.OkWithData(global.Config.SiteInfo, c)
}

// 路由分组方式二  测试
func (SettingsApi) SettingsSiteInfoView_2(c *gin.Context) {
	str := "成功了！"
	c.String(200, "这是 路由分组方式二 测试，%s\n", str)
}
