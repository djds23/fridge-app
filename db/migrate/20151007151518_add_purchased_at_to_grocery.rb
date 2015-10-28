class AddPurchasedAtToGrocery < ActiveRecord::Migration
  def change
    add_column :groceries, :purchased_at, :datetime
  end
end
