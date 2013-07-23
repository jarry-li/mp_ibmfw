json.array!(@provinces) do |province|
  json.extract! province, 
  json.url province_url(province, format: :json)
end
