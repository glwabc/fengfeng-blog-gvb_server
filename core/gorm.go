package core

import (
	"fmt"
	"gvb_server/global"
	"log"
	"time"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
)

func InitGorm() *gorm.DB {
	// 当使用 flag 绑定命令行时，未输入host地址，不会报错，而是给一个警告
	if global.Config.Mysql.Host == "" {
		global.Log.Warnln("未配置mysql，取消gorm连接")
		return nil
	}
	dsn := global.Config.Mysql.Dsn()

	var mysqlLogger logger.Interface
	if global.Config.System.Env == "debug" {
		// 开发环境显示所有的sql
		mysqlLogger = logger.Default.LogMode(logger.Info)
	} else {
		mysqlLogger = logger.Default.LogMode(logger.Error) // 只打印错误的sql
	}
	global.MysqlLog = logger.Default.LogMode(logger.Info)

	// cmd 启动mysql
	// > mysqld   // mysqld是mysql的守护进程。每次在使用mysql前必须先用它。
	// > mysql -uroot -proot      // 登录mysql
	// mysql> show databases;
	// mysql> create database gvb_db;   // 创建数据库
	// mysql> exit                      // 退出

	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{
		Logger: mysqlLogger,
	})
	/*
				conn, err := gorm.Open(mysql.New(mysql.Config{
					DSN:               "root:414524@tcp(127.0.0.1:3306)/gotest?charset=utf8mb4&parseTime=True&loc=Local",
					DefaultStringSize: 171,  // utf8mb4 string 类型字段的默认长度 ; utf8的string 类型字段的默认长度是256
					}), &gorm.Config{
						SkipDefaultTransaction: true, //配置成为true即可取消系统默认事务 关闭默认事务来提高性能
						// 系统默认为表名加s；表名是结构体名称的复数形式，会自动在后面加一个s，且会把表名的英文大写改成小写
						// GORM允许用户通过覆盖默认的命名策略，更改默认的命名约定，这需要实现接口 schema.Namer

						NamingStrategy: schema.NamingStrategy {
							TablePrefix:   "t_", // 表名前缀，`love`表为`t_love`
							// 假如数据库里的t_user表存在，假如现在把代码里的前缀改成了"m_" ,进行再次运行后，数据库里会同时
							// 存在t_user表与m_user表，以后操作的都是m_user , 可以把t_user删了

							SingularTable: true, // 使用单数表名，启用该选项后，`love` 表将是`love`，不再是loves
						},

						DisableForeignKeyConstraintWhenMigrating: true,  // 取消外键约束
						// 默认外键约束
						// 在使用AutoMigrate或Migrator接口的CreateTable方法创建表时，GORM 会自动创建外键约束，
						// 即会自动创建一个物理外键，使查询很缓慢；若要禁用该特性，可将其设置为 true，即逻辑外键，
						// 即需要自己手动去设置外键，建议改为true，会让数据库的处理速度快很多

						DisableAutomaticPing: true,
						// 完成初始化后，GORM会自动ping数据库以检查数据库的可用性，若要禁用该特性，可将其设置为true
				})

				// 常用模板
				db, err := gorm.Open(sqlite.Open("gorm.db"), &gorm.Config{
		  			SkipDefaultTransaction: false,  //不过在开发中我们常常配为false,即仍然遵循系统默认事务
		    		DisableForeignKeyConstraintWhenMigrating: true,  //在开发中我们常常配为true ,即取消外键约束
		     		NamingStrategy: schema.NamingStrategy{
		    			SingularTable: true, // 使用单数表名
		  			},
				})
	*/
	if err != nil {
		global.Log.Fatalf(fmt.Sprintf("[%s] mysql连接失败", dsn))
	}
	log.Println("mysql 连接成功")
	sqlDB, _ := db.DB()
	sqlDB.SetMaxIdleConns(10)               // 最大空闲连接数
	sqlDB.SetMaxOpenConns(100)              // 最多可容纳
	sqlDB.SetConnMaxLifetime(time.Hour * 4) // 连接最大复用时间，不能超过mysql的wait_timeout
	// mysql数据库有一个wait_timeout的配置，默认值为28800(秒)(即8小时).在默认配置不改变的情况下，
	// 如果连续8小时内都没有访问数据库的操作，再次访问mysql数据库的时候，mysql数据库会拒绝访问。
	return db
}
