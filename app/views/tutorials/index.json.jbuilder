json.array!(@tutorials) do |tutorial|
  json.extract! tutorial, :title, :user_id, :description
  json.url tutorial_url(tutorial, format: :json)
end