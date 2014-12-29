json.array!(@userslides) do |userslide|
  json.extract! userslide, :title, :usertutorial_id, :body, :image
  json.url userslide_url(userslide, format: :json)
end