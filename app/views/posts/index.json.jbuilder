json.array!(@posts) do |post|
  json.extract! post, :id, :title, :content, :user_id, :tags, :votes
  json.url post_url(post, format: :json)
end
