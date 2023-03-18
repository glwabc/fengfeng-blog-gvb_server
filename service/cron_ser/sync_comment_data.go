package cron_ser

import (
	"github.com/sirupsen/logrus"
	"gvb_server/global"
	"gvb_server/models"
	"gvb_server/service/redis_ser"
)

// SyncCommentData 同步评论数据到数据库
func SyncCommentData() {
	commentDiggInfo := redis_ser.NewCommentDigg().GetInfo()

	// 逐个更新
	for key, count := range commentDiggInfo {
		var comment models.CommentModel
		err := global.DB.Take(&comment, key).Error
		if err != nil {
			logrus.Error(err)
			continue
		}
		err = global.DB.Model(&comment).Update("digg_count", count).Error
		if err != nil {
			logrus.Error(err)
			continue
		}
		logrus.Infof("%s 更新成功 新点赞数为%d", comment.Content, comment.DiggCount)
	}
	redis_ser.NewCommentDigg().Clear()
}
