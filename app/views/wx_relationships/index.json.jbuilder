json.array!(@wx_relationships) do |wx_relationship|
  json.extract! wx_relationship, 
  json.url wx_relationship_url(wx_relationship, format: :json)
end
