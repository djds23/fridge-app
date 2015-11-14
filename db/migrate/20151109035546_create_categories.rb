class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.belongs_to :house_hold, index: true, foreign_key: true
      t.string :name
      t.integer :active

      t.timestamps null: false
    end
  end
end
