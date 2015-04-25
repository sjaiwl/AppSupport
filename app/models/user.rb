class User < ActiveRecord::Base
  mount_uploader :doctor_url, DoctorUrlUploader
  validates :doctor_name,  presence: true
  has_many :resources, dependent: :destroy
  has_many :patients, dependent: :destroy
end
