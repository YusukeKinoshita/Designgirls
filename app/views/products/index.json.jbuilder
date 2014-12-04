json.array!(@products) do |product|
  json.extract! product, :title, :description, :image, :user_id
  json.url product_url(product, format: :json)
end