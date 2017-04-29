json.array!(@posts) do |post|
  json.extract! post, :id, :concents, :user, :published
  json.url post_url(post, format: :json)
end
