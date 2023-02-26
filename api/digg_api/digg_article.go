package digg_api

import (
	"github.com/gin-gonic/gin"
	"gvb_server/models"
	"gvb_server/models/res"
	"gvb_server/service/redis_ser"
)

// DiggArticleView 文章点赞
// @Tags 文章管理
// @Summary 文章点赞
// @Description 文章点赞
// @Param data body models.ESIDRequest   true  "表示多个参数"
// @Router /api/digg/article [post]
// @Produce json
// @Success 200 {object} res.Response{}
func (DiggApi) DiggArticleView(c *gin.Context) {
	var cr models.ESIDRequest
	err := c.ShouldBindJSON(&cr)
	if err != nil {
		res.FailWithCode(res.ArgumentError, c)
		return
	}
	// 对长度校验
	// 查es
	redis_ser.NewDigg().Set(cr.ID)
	res.OkWithMessage("文章点赞成功", c)
}
