class AddResourceDescriptionToResource < ActiveRecord::Migration
  def change
    add_column :resources, :resource_description, :string
  end
end
