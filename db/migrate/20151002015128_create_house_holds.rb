class CreateHouseHolds < ActiveRecord::Migration
  def change
    create_table :house_holds do |t|
      t.timestamps null: false
    end
  end
end
