json.array!(@usertutorials) do |usertutorial|
  json.extract! usertutorial, :title, :user_id, :description
  json.url usertutorial_url(usertutorial, format: :json)
end