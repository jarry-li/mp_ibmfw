json.array!(@supplier_categories) do |supplier_category|
  json.extract! supplier_category, 
  json.url supplier_category_url(supplier_category, format: :json)
end
