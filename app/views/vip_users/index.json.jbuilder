json.array!(@vip_users) do |vip_user|
  json.extract! vip_user, 
  json.url vip_user_url(vip_user, format: :json)
end
