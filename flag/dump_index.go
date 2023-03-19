package flag

import (
	"context"
	"encoding/json"
	"fmt"
	"github.com/olivere/elastic/v7"
	"github.com/sirupsen/logrus"
	"gvb_server/global"
	"os"
)

type EsRawMessage struct {
	Row json.RawMessage `json:"row"`
	ID  string          `json:"id"`
}

type EsIndexResponse struct {
	Data    []EsRawMessage `json:"data"`
	Mapping interface{}    `json:"mapping"`
}

// DumpIndex
// go run main.go -es -dump article_index
// go run main.go -es -dump full_text_index
func DumpIndex(index string) {
	result, err := global.ESClient.
		Search(index).
		Query(elastic.NewMatchAllQuery()).
		Size(10000).
		Do(context.Background())
	if err != nil {
		logrus.Error(err)
		return
	}
	mapping, err := global.ESClient.GetMapping().Index("").Do(context.Background())
	if err != nil {
		logrus.Error(err)
		return
	}

	var jsonList []EsRawMessage
	for _, hit := range result.Hits.Hits {
		var jsonData EsRawMessage
		jsonData.Row = hit.Source
		jsonData.ID = hit.Id
		jsonList = append(jsonList, jsonData)
	}
	if len(jsonList) == 0 {
		logrus.Infof("%s 索引下无数据", index)
		return
	}

	indexMapping, ok := mapping[index]
	if !ok {
		logrus.Errorf("该mapping下无此索引")
		return
	}

	esIndexResponse := EsIndexResponse{
		Data:    jsonList,
		Mapping: indexMapping,
	}

	file, err := os.Create(fmt.Sprintf("%s.json", index))
	defer file.Close()
	if err != nil {
		logrus.Error(err)
		return
	}
	byteData, _ := json.Marshal(esIndexResponse)
	file.Write(byteData)
	logrus.Infof("%s 索引导入成功，共%d条记录", index, len(jsonList))

}
