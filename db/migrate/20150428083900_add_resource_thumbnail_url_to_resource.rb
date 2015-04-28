class AddResourceThumbnailUrlToResource < ActiveRecord::Migration
  def change
    add_column :resources, :resource_thumbnailUrl, :string
  end
end
