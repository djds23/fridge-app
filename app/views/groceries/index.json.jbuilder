json.array!(@groceries) do |grocery|
  json.extract! grocery, :id, :item_name, :quantity
  json.url grocery_url(grocery, format: :json)
end
