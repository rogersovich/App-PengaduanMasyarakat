json.extract! user, :id, :name, :username, :password, :telp, :level, :created_at, :updated_at
json.url user_url(user, format: :json)
