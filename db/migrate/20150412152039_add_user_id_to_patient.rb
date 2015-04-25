class AddUserIdToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :user_id, :integer
  end
end
