# GVBServer 枫枫知道GVB项目后端

枫枫知道七代博客 gvb项目的后端项目

项目技术栈：
`go` `gin` `gorm` `elasticsearch` `websocket`

[![image](https://img.shields.io/badge/%E6%9E%AB%E6%9E%AB%E7%9F%A5%E9%81%93-7.0.2-brightgreen)](http://blog.fengfengzhidao.com/)
![image](https://img.shields.io/badge/golang-1.19-yellowgreen)

## 项目运行


## 项目部署

```shell
// 交叉编译 
set GOARCH=amd64
set GOOS=linux
go build -o main
set GOOS=windows

mysqldump -uroot -proot gvb_db > gvb.sql
go run main.go -es -dump article_index
go run main.go -es -dump full_text_index


docs
uploads
main
settings.yaml
article_index.json
full_text_index.json
gvb.sql
```

```shell

```

```text
server {
    listen       80;
    server_name  v7.fengfengzhidao.com;

    location / {
      try_files $uri $uri/ /index.html;  # 解决刷新404问题
      root   /www/wwwroot/gvb/gvb_admin/dist;
      index  index.html index.htm;
    }

    location /api/ {
      # rewrite ^/(api/.*) /$1 break;
      proxy_set_header Host $host;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header REMOTE-HOST $remote_addr;
      proxy_pass http://127.0.0.1:8080/api/;
    }
    location /uploads/ {
      alias /www/wwwroot/gvb/gvb_server/uploads/;
    }
    location /ws/ {
      proxy_pass http://127.0.0.1:8080/api/;
      proxy_http_version 1.1;
      proxy_set_header Upgrade $http_upgrade;
      proxy_set_header Connection "upgrade";
      proxy_redirect off;
      proxy_set_header Host $host;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header X-Forwarded-Host $server_name;
      proxy_read_timeout 3600s;  # 长连接时间
    }
}
```