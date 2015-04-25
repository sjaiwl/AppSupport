require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { doctor_birthday: @user.doctor_birthday, doctor_department: @user.doctor_department, doctor_gender: @user.doctor_gender, doctor_job: @user.doctor_job, doctor_name: @user.doctor_name, doctor_password: @user.doctor_password, doctor_telephone: @user.doctor_telephone, doctor_url: @user.doctor_url }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { doctor_birthday: @user.doctor_birthday, doctor_department: @user.doctor_department, doctor_gender: @user.doctor_gender, doctor_job: @user.doctor_job, doctor_name: @user.doctor_name, doctor_password: @user.doctor_password, doctor_telephone: @user.doctor_telephone, doctor_url: @user.doctor_url }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
