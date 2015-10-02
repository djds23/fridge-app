json.array!(@groceries) do |grocery|
  json.extract! grocery, :id, :name, :quantity
  json.url grocery_url(grocery, format: :json)
end
