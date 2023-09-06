package core

import (
	"bytes"
	"fmt"
	"gvb_server/global"
	"os"
	"path"

	"github.com/sirupsen/logrus"
)

// 颜色
const (
	red    = 31
	yellow = 33
	blue   = 36
	gray   = 37
)

type LogFormatter struct{}

// 自定义日志输出
// 设置Format方法 实现Formatter(entry *logrus.Entry) ([]byte, error)接口
func (t *LogFormatter) Format(entry *logrus.Entry) ([]byte, error) {
	//根据不同的level去展示颜色
	var levelColor int
	switch entry.Level { // type logrus.Level uint32
	case logrus.DebugLevel, logrus.TraceLevel:
		levelColor = gray
	case logrus.WarnLevel:
		levelColor = yellow
	case logrus.ErrorLevel, logrus.FatalLevel, logrus.PanicLevel:
		levelColor = red
	default:
		levelColor = blue
	}
	// Go标准库中的bytes.Buffer（下文用Buffer表示）类似于一个FIFO的队列，它是一个流式字节缓冲区。
	// 我们可以持续向Buffer尾部写入数据，从Buffer头部读取数据。当Buffer内部空间不足以满足写入数据的大小时，会自动扩容。
	// Buffer只有扩容策略，没有缩容策略，即扩容到多大就占多大的内存，即使内部contentSize很小，而capacity已增长到非常大。
	// 当前使用的内存块只有在Buffer对象释放时才能随之释放。
	// Buffer在创建时并不会申请内存块，只有在往里写数据时才会申请，首次申请的大小即为写入数据的大小。
	// 如果写入的数据小于64字节，则按64字节申请。
	var b *bytes.Buffer
	if entry.Buffer != nil {
		b = entry.Buffer // field entry.Buffer *bytes.Buffer
	} else {
		b = &bytes.Buffer{}
	}

	log := global.Config.Logger

	//自定义日期格式
	timestamp := entry.Time.Format("2006-01-02 15:04:05")
	// HasCaller()为true才会有调用信息
	// func (entry Entry) HasCaller() (has bool) {
	// 		return entry.Logger != nil &&
	// 			entry.Logger.ReportCaller &&
	// 			entry.Caller != nil
	// }
	// entry.HasCaller() 的判断是必须的，
	// 否则如果外部没有设置logrus.SetReportCaller(true)，entry.Caller.*的调用会引发Panic
	if entry.HasCaller() {
		// 自定义文件路径
		// 	 entry.Caller.File：文件名
		// 	 entry.Caller.Line: 行号
		// 	 entry.Caller.Function：函数名
		funcVal := entry.Caller.Function
		// golang中path.Base(pathString)函数,pathString的值必须为linux风格的路径，
		// 即 "/" 才能够正常的获取 最后的 路径段 的值。
		// 在如果路径是windows风格的，即 "\"，需要使用 filepath.ToSlash()函数，将路径转为linux风格。
		// currentPath, _ := os.Getwd()
		// fmt.Println(currentPath)                     // D:\go_work\src\test
		// fmt.Println(path.Base(currentPath))          // D:\go_work\src\test
		//
		// currentPath = filepath.ToSlash(currentPath)
		// fmt.Println(currentPath)                    // D:/go_work/src/test
		// fmt.Println(path.Base(currentPath))        // test
		fileVal := fmt.Sprintf("%s:%d", path.Base(entry.Caller.File), entry.Caller.Line)
		// 自定义输出格式
		// Linux终端特殊控制符，可以控制终端的显示效果，如清屏，前景背景色设置，字体设置等。
		// \x1b 表示16进制码1b，1b对应ascii码是ESC
		// [是一个CSI(Control sequence introducer),转义序列作用由最后一个字符决定
		// 0是参数，表恢复默认属性。
		// K（清除行）
		// 常用控制码
		// \x1b[0m                 关闭所有属性
		// \x1b[30m -- \x1b[37m    设置前景色
		// 		30:    黑色
		// 		31:    红色
		// 		32:    绿色
		// 		33:    黄色
		// 		34:    蓝色
		// 		35:    紫色
		// 		36:    深绿色
		// 		37:    白色      灰色？？？
		// \x1b[40m -- \x1b[47m    设置背景色
		fmt.Fprintf(b, "%s[%s] \x1b[%dm[%s]\x1b[0m %s %s %s\n", log.Prefix, timestamp, levelColor, entry.Level, fileVal, funcVal, entry.Message)
	} else {
		fmt.Fprintf(b, "%s[%s] \x1b[%dm[%s]\x1b[0m %s\n", log.Prefix, timestamp, levelColor, entry.Level, entry.Message)
	}
	return b.Bytes(), nil

	// 写入方式二
	// var newLog string
	// newLog = fmt.Sprintf("%s \n", entry.Message)
	// b.WriteString(newLog)

	// 写入方式三
	// msg := fmt.Sprintf("%s [%s:%d][GOID:%d][%s] %s\n", timestamp, file, len, getGID(), strings.ToUpper(entry.Level.String()), entry.Message)
	// return []byte(msg), nil
}

func InitLogger() *logrus.Logger {
	mLog := logrus.New() //新建一个实例
	// func logrus.New() *logrus.Logger {
	// 	 return &Logger{
	// 	 	Out:          os.Stderr,
	// 	 	Formatter:    new(TextFormatter),
	// 	 	Hooks:        make(LevelHooks),
	// 	 	Level:        InfoLevel,
	// 	 	ExitFunc:     os.Exit,
	// 	 	ReportCaller: false,
	// 	 }
	// }
	// 设置将日志输出到标准输出（默认的输出为stderr，标准错误）
	// 日志消息输出可以是任意的io.writer类型
	mLog.SetOutput(os.Stdout) //设置输出类型
	/*
		// 同时输出屏幕和文件日志
		file, err := os.OpenFile("checkemstools.log", os.O_CREATE|os.O_WRONLY|os.O_APPEND, 0666)
		writers := []io.Writer{
			file,
			os.Stdout }
		//同时写文件和屏幕
		fileAndStdoutWriter := io.MultiWriter(writers...)
		if err == nil {
			log.SetOutput(fileAndStdoutWriter)
		} else {
			log.Info("failed to log to file.")
		}
	*/
	// func (*logrus.Logger).SetReportCaller(reportCaller bool) {
	// 	logger.mu.Lock()
	// 	defer logger.mu.Unlock()
	// 	logger.ReportCaller = reportCaller
	// }
	mLog.SetReportCaller(global.Config.Logger.ShowLine) //开启返回函数名和行号
	// func (*logrus.Logger).SetFormatter(formatter logrus.Formatter)
	// type Formatter interface {
	//	   Format(*Entry) ([]byte, error)
	// }
	mLog.SetFormatter(&LogFormatter{}) //设置自己定义的Formatter
	// ​​logrus​​支持的日志级别：
	// ​	​Panic​​​：记录日志，然后​​panic​​。
	// 	   ​Fatal​​：致命错误，出现错误时程序无法正常运转。输出日志后，程序退出；
	// ​	​Error​​：错误日志，需要查看原因；
	// 	   ​Warn​​：警告信息，提醒程序员注意；
	// 	   ​Info​​：关键操作，核心流程的日志；
	// 	   ​​Debug​​：一般程序中输出的调试信息；
	// ​	​Trace​​：很细粒度的信息，一般用不到；
	// 日志级别从上向下依次增加，​​Trace​​​最大，​​Panic​​​最小。​​logrus​​​有一个日志级别，高于这个级别的日志不会输出。
	// 默认的级别为​​InfoLevel​​​。所以为了能看到​​Trace​​​和​​Debug​​​日志，要设置日志级别为​​TraceLevel​​。
	// ParseLevel takes a string level and returns the Logrus log level constant常量.
	// type logrus.Level uint32
	level, err := logrus.ParseLevel(global.Config.Logger.Level)
	if err != nil { // 如果存在错误，无法设置日志等级，则提供一个默认日志等级
		level = logrus.InfoLevel
	}
	mLog.SetLevel(level) // 设置最低的Level
	InitDefaultLogger()  // 修改全局Log
	return mLog
}

// 通过logrus包中 自带 的两种Formatter设置日志格式
// func InitLogger_2() *logrus.Logger {
// 	// logrus中，使用如下方法设置日志格式
// 	// func SetFormatter(formatter Formatter)
// 	// 其中Formatter是一个接口
// 	// type Formatter interface {
// 	// 		Format(*Entry) ([]byte, error)
// 	// }
// 	//
// 	// !!!! 所以，实现自定义日志格式，本质上就是实现Formatter接口，然后通过SetFormatter方式将其告知logrus。 !!!
// 	//
// 	// logrus包中自带两种Formatter，分别是TextFormatter和JSONFormatter。 默认情况下，使用TextFormatter输出。
// 	// TextFormatter有若干可定制参数，常用参数如下
// 	// type TextFormatter struct{
// 	// 		//颜色显示相关
// 	// 		ForceColors bool
// 	// 		EnvironmentOverrideColors bool
// 	// 		DisableColors bool

// 	// 		//日志中的键值对加引号相关
// 	// 		ForceQuote bool
// 	// 		DisableQuote bool
// 	// 		QuoteEmptyFields bool

// 	// 		//时间戳相关
// 	// 		DisableTimestamp bool
// 	// 		FullTimestamp bool
// 	// 		TimestampFormat string
// 	// }
// 	//  示例一：
// 	// 	logrus.SetFormatter(&logrus.TextFormatter{
// 	// 		ForceQuote:true,    //键值对加引号
// 	// 		TimestampFormat:"2006-01-02 15:04:05",  //时间格式
// 	// 		FullTimestamp:true,
// 	// 	})
// 	// 	logrus.WithField("name", "ball").WithField("say", "hi").Info("info log")
// 	// 输出
// 	// INFO[2021-05-10 16:28:50] info log      name="ball" say="hi"
// 	// 默认是Colors模式，该模式下，必须设置FullTimestamp:true， 否则时间显示不生效。
// 	//
// 	// 示例二：
// 	// 	logrus.SetFormatter(&logrus.TextFormatter{
// 	// 		DisableColors:true,
// 	// 		ForceQuote:false,
// 	// 		TimestampFormat:"2006-01-02 15:04:05",
// 	// 	})
// 	//输出
// 	// time="2021-05-10 16:32:42" level=info msg="info log" name=ball say=hi
// 	//
// 	// 示例三
// 	// 	logrus.SetFormatter(&logrus.JSONFormatter{
// 	// 		TimestampFormat:"2006-01-02 15:04:05",
// 	// 		PrettyPrint: true,
// 	// 	})
// 	//  logrus.WithField("name", "ball").WithField("say", "hi").Info("info log")
// 	//输出
// 	// {
// 	// 	"level": "info",
// 	// 	"msg": "info log",
// 	// 	"name": "ball",
// 	// 	"say": "hi",
// 	// 	"time": "2021-05-10 16:36:05"
// 	// }
// 	// 说明：
// 	// 若不设置PrettyPrint: true， 则json为单行输出
// 	//
// 	// logrus.TextFormatter通过Format方法实现了Formatter接口
// 	// func (f *TextFormatter) Format(entry *Entry) ([]byte, error) {
// 	// 	……
// 	// 	var b *bytes.Buffer
// 	// 	if entry.Buffer != nil {
// 	// 		b = entry.Buffer
// 	// 	} else {
// 	// 		b = &bytes.Buffer{}
// 	// 	}
// 	// 	……
// 	// 	f.printColored(b, entry, keys, data, timestampFormat)
// 	// 	……
// 	// 	f.appendKeyValue(b, key, value)
// 	// 	……
// 	// 	b.WriteByte('\n')
// 	// 	return b.Bytes(), nil
// 	// }

// 	return nil
// }

func InitDefaultLogger() {
	// 全局log
	logrus.SetOutput(os.Stdout) //设置输出类型
	logrus.SetReportCaller(false)
	// logrus.SetReportCaller(global.Config.Logger.ShowLine) //开启返回函数名  文件名  行号
	logrus.SetFormatter(&LogFormatter{}) //设置自己定义的Formatter
	level, err := logrus.ParseLevel(global.Config.Logger.Level)
	if err != nil {
		level = logrus.InfoLevel
	}
	logrus.SetLevel(level) //设置最低的Level
}

// 由于logrus本身并不提供写文件, 并且按照日期自动分割, 删除过期日志文件的功能.
// 一般情况下大家都是使用 github.com/rifflock/lfshook 配合 github.com/lestrrat-go/file-rotatelogs 来实现相关的功能
