json.array!(@posts) do |post|
  json.extract! post, :id, :name, :address, :mail, :mobile
  json.url post_url(post, format: :json)
end
