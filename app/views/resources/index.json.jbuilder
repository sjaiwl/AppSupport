json.array!(@resources) do |resource|
  json.extract! resource, :id, :user_id, :suffer_id, :resource_type, :resource_url, :resource_size, :resource_category, :resource_description
  json.url resource_url(resource, format: :json)
end
