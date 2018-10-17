json.extract! meal, :id, :name, :type, :description, :shop_id, :created_at, :updated_at
json.url meal_url(meal, format: :json)
