namespace :fix do
  desc "Make quantities 0"
  task :quantity => :environment do
    Grocery.all.each do |grocery|
      grocery.quantity = 0
      grocery.save!
    end
  end
end
