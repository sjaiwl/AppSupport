json.array!(@users) do |user|
  json.extract! user, :id, :doctor_name, :doctor_url, :doctor_password, :doctor_gender, :doctor_birthday, :doctor_job, :doctor_department, :doctor_telephone
  json.url user_url(user, format: :json)
end
