json.array!(@activity_notices) do |activity_notice|
  json.extract! activity_notice, 
  json.url activity_notice_url(activity_notice, format: :json)
end
