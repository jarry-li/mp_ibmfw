json.array!(@websites) do |website|
  json.extract! website, 
  json.url website_url(website, format: :json)
end
