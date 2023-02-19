package config

type Config struct {
	Mysql    Mysql    `yaml:"mysql"`
	Logger   Logger   `yaml:"logger"`
	System   System   `yaml:"system"`
	SiteInfo SiteInfo `yaml:"site_info"`
	Upload   Upload   `yaml:"upload"`
	QQ       QQ       `yaml:"qq"`
	QiNiu    QiNiu    `yaml:"qi_niu"`
	Email    Email    `yaml:"email"`
	Jwy      Jwy      `yaml:"jwy"`
	Redis    Redis    `yaml:"redis"`
	ES       ES       `yaml:"es"`
}
