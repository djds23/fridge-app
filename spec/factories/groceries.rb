FactoryGirl.define do
  factory :grocery do
    item_name 'pizza'
    category
    resident
    quantity 200

    trait :in_stock do
      quantity 200
    end

    trait :running_low do
      quantity 100
    end

    trait :out_of_stock do
      quantity 000
    end
  end
end
