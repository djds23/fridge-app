class CreateResidents < ActiveRecord::Migration
  def change
    create_table :residents do |t|
      t.string :username

      t.timestamps null: false
    end
  end
end
