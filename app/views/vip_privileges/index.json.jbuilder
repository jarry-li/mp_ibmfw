json.array!(@vip_privileges) do |vip_privilege|
  json.extract! vip_privilege, 
  json.url vip_privilege_url(vip_privilege, format: :json)
end
