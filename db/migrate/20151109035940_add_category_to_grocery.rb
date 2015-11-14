class AddCategoryToGrocery < ActiveRecord::Migration
  def change
    add_reference :groceries, :category, index: true, foreign_key: true
  end
end
