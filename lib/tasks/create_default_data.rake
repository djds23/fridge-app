namespace :create do
  desc "HouseHold & Initial Residents"
  task :household => :environment do
    build_household_and_residents
  end

  desc "Create categories and assign groceries to them"
  task :essentials => :environment do
    household = build_household_and_residents

    grocery_category = Category.where(
      name: 'Groceries',
      house_hold_id: household.id
    ).first_or_create

    create_grocery('Olive Oil', grocery_category)
    create_grocery('Siracha', grocery_category)
    create_grocery('Garlic', grocery_category)

    toiletries_category = Category.where(
      name: 'Toiletries',
      house_hold_id: household.id
    ).first_or_create

    create_grocery('Toilet Paper', toiletries_category)
    create_grocery('Paper Towels', toiletries_category)
  end
end

def build_household_and_residents
  household = HouseHold.where('id IS NOT NULL').first_or_create
  residents = Resident.where(household_id: household.id)
  return household if residents.present?

  Resident.create(username: 'Stevie')
  Resident.create(username: 'Dean')
  household
end

def create_grocery(name, category)
  offset = rand(Resident.count)
  Grocery.create do |grocery|
    grocery.category_id = category.id
    grocery.resident_id = Resident.offset(offset).first.id
    grocery.item_name = name
  end
end

