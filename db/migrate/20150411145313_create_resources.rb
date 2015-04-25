class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.references :user
      t.belongs_to :user
      t.integer :user_id
      t.integer :suffer_id
      t.integer :resource_type
      t.string :resource_url
      t.string :resource_size
      t.string :resource_category
      t.timestamps null: false
    end
  end
end
