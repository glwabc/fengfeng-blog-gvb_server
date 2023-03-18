package cron_ser

import (
	"github.com/go-co-op/gocron"
	"github.com/sirupsen/logrus"
	"time"
)

func CronInit() {
	timezone, err := time.LoadLocation("Asia/Shanghai")
	if err != nil {
		logrus.Error(err.Error())
		return
	}
	cron := gocron.NewScheduler(timezone)
	cron.Cron("* * * * *").Do(SyncArticleData)
	cron.Cron("* * * * *").Do(SyncCommentData)
	cron.StartBlocking()
}
