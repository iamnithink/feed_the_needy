json.extract! food, :id, :name, :email, :phone, :address, :description, :user_id, :created_at, :updated_at
json.url food_url(food, format: :json)
