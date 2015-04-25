class Patient < ActiveRecord::Base
  mount_uploader :patient_url, PatientUrlUploader
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  validates :user_id, presence: true
end
