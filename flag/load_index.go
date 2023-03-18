package flag

import (
	"context"
	"encoding/json"
	"github.com/sirupsen/logrus"
	"gvb_server/global"
	"os"
	"strings"
)

func LoadIndex(jsonName string) {
	// 读取文件
	byteData, err := os.ReadFile(jsonName)
	if err != nil {
		logrus.Error(err)
		return
	}
	var jsonData EsIndexResponse
	err = json.Unmarshal(byteData, &jsonData)
	if err != nil {
		logrus.Error(err)
		return
	}
	_list := strings.Split(jsonName, ".")
	if len(_list) != 2 {
		logrus.Error("json文件名称错误")
		return
	}
	index := _list[0]
	bd, _ := json.Marshal(jsonData.Mapping)
	// 创建索引
	CreateIndex(index, string(bd))
	for _, data := range jsonData.Data {
		_, err := global.ESClient.Index().
			Index(index).Id(data.ID).
			BodyJson(data.Row).Do(context.Background())
		if err != nil {
			logrus.Error(err)
			continue
		}
		logrus.Infof("%s 录入成功", data.ID)
	}
	logrus.Infof("%s 索引录入成功", index)

}

func RemoveIndex(index string) {
	logrus.Info("索引存在，删除索引")
	// 删除索引
	indexDelete, err := global.ESClient.DeleteIndex(index).Do(context.Background())
	if err != nil {
		logrus.Error("删除索引失败")
		logrus.Error(err.Error())
		return
	}
	if !indexDelete.Acknowledged {
		logrus.Error("删除索引失败")
		return
	}
	logrus.Info("索引删除成功")
}

func CreateIndex(index string, mapping string) {
	if IndexExists(index) {
		// 有索引
		RemoveIndex(index)
	}
	// 没有索引
	// 创建索引
	createIndex, err := global.ESClient.
		CreateIndex(index).
		BodyString(mapping).
		Do(context.Background())
	if err != nil {
		logrus.Error("创建索引失败")
		logrus.Error(err.Error())
		return
	}
	if !createIndex.Acknowledged {
		logrus.Error("创建失败")
		return
	}
	logrus.Infof("索引 %s 创建成功", index)
}
func IndexExists(index string) bool {
	exists, err := global.ESClient.
		IndexExists(index).
		Do(context.Background())
	if err != nil {
		logrus.Error(err.Error())
		return exists
	}
	return exists
}
