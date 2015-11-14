FactoryGirl.define do
  factory :category do
    house_hold HouseHold.first_or_create
    active true
    name "Groceries"
  end
end

