class AddPurchasedAtToGrocery < ActiveRecord::Migration
  def change
    add_column :groceries, :purchased_at, :date_time
  end
end
