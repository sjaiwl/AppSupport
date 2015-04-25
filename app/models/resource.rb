class Resource < ActiveRecord::Base
  mount_uploader :resource_url, ResourceUrlUploader
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  validates :user_id, presence: true
end
