class GroceryColumnRename < ActiveRecord::Migration
  def up
    rename_column :groceries, :name, :item_name 
  end

  def down
    rename_column :groceries, :item_name, :name
  end
end
