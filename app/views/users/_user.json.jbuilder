json.extract! user, :id, :login, :email, :password, :role, :coin_id, :balance, :created_at, :updated_at
json.url user_url(user, format: :json)
