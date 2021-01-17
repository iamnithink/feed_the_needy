json.extract! food, :id, :name, :email, :phone, :address, :description, :food_type, :user_type, :number_of_plate, :status, :user_id, :created_at, :updated_at
json.url food_url(food, format: :json)
