namespace :fix do
  desc "Make quantities 0"
  task :quantity => :environment do
    Grocery.all.each do |grocery|
      grocery.quantity = 0
      grocery.save!
    end
  end

  desc "Create categories and assign groceries to them"
  task :categories => :environment do
    category = Category.where(name: 'Groceries').first_or_create!
    Grocery.all.each do |grocery|
      if grocery.category.blank?
        grocery.category = category
      end
      grocery.save!
    end
  end

  desc "Delete all grocery records"
  task :trunc_essentials => :environment do
    Grocery.all.delete_all
    Category.all.delete_all
  end
end

