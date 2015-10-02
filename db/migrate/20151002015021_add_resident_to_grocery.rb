class AddResidentToGrocery < ActiveRecord::Migration
  def change
    add_reference :groceries, :resident, index: true, foreign_key: true
  end
end
