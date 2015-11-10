FactoryGirl.define do
  factory :grocery do
    name 'pizza'
    category
    resident

    trait :in_stock do
      quantity 5
    end

    trait :running_low do
      quantity 1
    end

    trait :out_of_stock do
      quantity 0
    end
  end
end
