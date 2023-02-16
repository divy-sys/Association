json.extract! user, :id, :Username, :created_at, :updated_at
json.url user_url(user, format: :json)
