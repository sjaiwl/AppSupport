# AppSupport
湘雅医疗数据移动开发后台，基于rails框架开发，主要实现用户的登陆，注册，密码找回等功能，最主要的是能够实现图片，视频，音频的上传和保存。
## 为什么要选用rails框架？
* Rails是一个全栈式的MVC框架，通过Rails可以实现MVC模式中的各个层次，并使它们无缝地协同运转起来。

* 经过改进之后，通过支架系统，开发人员可以方便快捷地操纵数据库中的数据表，而不要自己去建立数据库，定义数据库的查询语言。

* 使用rails框架能够加快开发进度，省去很多麻烦的事情。

## 使用脚手架功能定义数据库表以及指定数据库
* 本项目中使用的是mysql数据库，如果不指定会默认使用sqlite数据库
```
default: &default
  adapter: mysql2 #指定mysql数据库
  encoding: utf8
  pool: 5
  username: root
  password:
  socket: /tmp/mysql.sock

development:
  <<: *default
  database: AppSupport_development #自己的数据库名
```
* 关与脚手架功能以及命令的代码，可以看看ruby on rails教程
  * [点击查看](https://github.com/sjaiwl/image_folder/blob/master/Ruby%20on%20Rails%204%20Tutorial%20中文版.pdf)


