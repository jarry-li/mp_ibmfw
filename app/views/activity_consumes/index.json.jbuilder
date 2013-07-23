json.array!(@activity_consumes) do |activity_consume|
  json.extract! activity_consume, 
  json.url activity_consume_url(activity_consume, format: :json)
end
