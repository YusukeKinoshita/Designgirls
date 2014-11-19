json.array!(@slides) do |slide|
  json.extract! slide, :title, :tutorial_id, :body, :image
  json.url slide_url(slide, format: :json)
end