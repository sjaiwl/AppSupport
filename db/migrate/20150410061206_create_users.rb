class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :doctor_name
      t.string :doctor_url
      t.string :doctor_password
      t.string :doctor_gender
      t.string :doctor_birthday
      t.string :doctor_job
      t.string :doctor_department
      t.string :doctor_telephone
      t.timestamps null: false
    end
  end
end
