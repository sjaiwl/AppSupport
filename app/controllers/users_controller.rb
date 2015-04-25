class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #使用用户名和密码登陆
  def login
    @user = User.find_by(doctor_name: params[:doctor_name], doctor_password: params[:doctor_password])
    if @user == nil
      json_str = "{'response':未找到用户}"
      render json: json_str
    end
  end

  #注册
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

#更新用户信息
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

#更新用户头像
def update_userPictureUrl
  @user = User.find(params[:doctor_id])
  @user.update_attributes(:doctor_url => params[:doctor_url])
  if @user.save
    doctor_url = @user.doctor_url.url
    json_str = "{'doctor_url':'#{IP}#{doctor_url}'}"
    render json: json_str
  else
    render json: @user.errors
  end
end

#重置密码
def setting_password
  @user = User.find_by(doctor_telephone: params[:doctor_telephone])
  if @user.update(user_params)
    json_str = "{'success':1}"
    render json: json_str
  else
    json_str = "{'success':0}"
    render json: json_str
  end
end

#根据电话查找用户
def query_user
  @user = User.find_by(doctor_telephone: params[:doctor_telephone])
  if @user == nil
    json_str = "{'success':0}"
    render json: json_str
  else
    json_str = "{'success':1}"
    render json: json_str
  end
end

private
# Use callbacks to share common setup or constraints between actions.
def set_user
  @user = User.find(params[:id])
end

# Never trust parameters from the scary internet, only allow the white list through.
def user_params
  params.require(:user).permit(:doctor_name, :doctor_url, :doctor_password, :doctor_gender, :doctor_birthday, :doctor_job, :doctor_department, :doctor_telephone)
end


end
