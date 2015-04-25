if @user==nil
  json.set! :error, '找不到用户'
else
  json.extract! @user, :doctor_name, :doctor_password, :doctor_gender, :doctor_birthday, :doctor_job, :doctor_department, :doctor_telephone
  if @user.doctor_url.url == nil
    json.set! :doctor_url, @user.doctor_url.url
  else
    json.set! :doctor_url, IP+@user.doctor_url.url
  end
  json.set! :doctor_id, @user.id
end