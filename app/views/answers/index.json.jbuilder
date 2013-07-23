json.array!(@answers) do |answer|
  json.extract! answer, :supplier_id, :question_id, :content, :material_id, :answer_type
  json.url answer_url(answer, format: :json)
end
