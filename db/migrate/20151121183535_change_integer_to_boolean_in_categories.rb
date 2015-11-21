class ChangeIntegerToBooleanInCategories < ActiveRecord::Migration
  def up
    Category.reset_column_information
    remove_column :categories, :active if Category.column_names.include?('active')
    add_column :categories, :active, :boolean
  end

  def down 
    remove_column :categories, :active if Category.column_names.include?('active')
    add_column :categories, :active, :integer
  end
end
