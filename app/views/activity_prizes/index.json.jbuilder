json.array!(@activity_prizes) do |activity_prize|
  json.extract! activity_prize, 
  json.url activity_prize_url(activity_prize, format: :json)
end
