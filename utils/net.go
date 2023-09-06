package utils

import (
	"log"
	"net"

	"github.com/sirupsen/logrus"
)

func GetIPList() (ipList []string) {
	// 使用net.Interfaces()函数获取设备信息
	// func net.Interfaces() ([]net.Interface, error)
	// type Interface struct {
	// 		Index        int          // positive integer that starts at one, zero is never used
	// 		MTU          int          // maximum transmission unit
	// 		Name         string       // e.g., "en0", "lo0", "eth0.100"
	// 		HardwareAddr HardwareAddr // IEEE MAC-48, EUI-48 and EUI-64 form
	// 		Flags        Flags        // e.g., FlagUp, FlagLoopback, FlagMulticast
	// }
	interfaces, err := net.Interfaces()
	if err != nil {
		log.Fatal(err)
	}
	for _, i2 := range interfaces {
		addrees, err := i2.Addrs()
		if err != nil {
			logrus.Error(err)
			continue
		}
		for _, addr := range addrees {
			ipNet, ok := addr.(*net.IPNet)
			if !ok {
				continue
			}
			ip4 := ipNet.IP.To4()
			if ip4 == nil {
				continue
			}
			ipList = append(ipList, ip4.String())
		}
	}
	return
}
