json.array!(@vip_cards) do |vip_card|
  json.extract! vip_card, 
  json.url vip_card_url(vip_card, format: :json)
end
