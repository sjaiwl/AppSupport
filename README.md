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

## 怎么实现具体的登陆，注册等功能(在controller中实现以下功能)
* 用户名和密码登陆
```
def login
    @user = User.find_by(doctor_name: params[:doctor_name], doctor_password: params[:doctor_password])
    if @user == nil
      json_str = "{'response':未找到用户}"
      render json: json_str
    end
  end
```
* 注册
```
  def register
    @user1 = User.find_by(doctor_name: params[:doctor_name])
    if @user1 !=nil
      json_str = "{'success':-1}"
      render json: json_str
    else
      @user = User.new(doctor_name: params[:doctor_name], doctor_gender: params[:doctor_gender], doctor_password: params[:doctor_password])
      if @user.save
        json_str = "{'success':1}"
        render json: json_str
      else
        json_str = "{'success':0}"
        render json: json_str
      end
    end
  end
```
* 更新用户信息
``` ruby
def update_user
  @user = User.find(params[:doctor_id])
  if @user.update(user_params)
    json_str = "{'success':1}"
    render json: json_str
  else
    json_str = "{'success':0}"
    render json: json_str
  end
end
```
* 为指定url添加路由，这一店很重要，不然手机端无法访问到服务器。
  * 这里是我的routes.rb中的内容
  ```
  match '/login', to: 'users#login', via: [:post]
  match '/register', to: 'users#register', via: [:post]
  match '/update_user', to: 'users#update_user', via: [:post]
  match '/setting_password', to: 'users#setting_password', via: [:post]
  match '/query_user', to: 'users#query_user', via: [:post]
  match '/get_allPatient', to: 'patients#get_allPatient', via: [:get]
  match '/get_searchPatient', to: 'patients#get_searchPatient', via: [:get]
  match '/get_allResource', to: 'resources#get_allResource', via: [:get]
  match '/get_patientResource', to: 'resources#get_patientResource', via: [:get]
  match '/update_userPictureUrl', to: 'users#update_userPictureUrl', via: [:post]
  match '/new_resource', to: 'resources#new_resource', via: [:post]
  match '/delete_resource', to: 'resources#delete_resource', via: [:post]
  ```
  
## 怎么实现图片，视频，音频的上传
* 使用carrierwave上传插件
  * Gemfile中配置
  ``` ruby
    # 上传图片插件
    gem 'carrierwave'
  ```
  * 具体的操作方法可以查看下面的博客

    [点击查看](http://blog.csdn.net/yfeng1226/article/details/7264411)
    
  * 上传的图片，视频以及音频都必须要是file文件，不然无法上传成功

## 参考资料:
* [Ruby on Rails 指南](http://guides.ruby-china.org)
* [Ruby on Rails 快速开发 Web 应用程序](http://www.ibm.com/developerworks/cn/linux/l-rubyrails/)
* [Ruby on Rails 教程](http://railstutorial-china.org)
