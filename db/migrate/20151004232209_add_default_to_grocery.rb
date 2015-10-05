class AddDefaultToGrocery < ActiveRecord::Migration
  def up
    change_column :groceries, :quantity, :int, default: 0
  end

  def down
    # This cannot be undone
  end
end
