json.array!(@activity_properties) do |activity_property|
  json.extract! activity_property, 
  json.url activity_property_url(activity_property, format: :json)
end
