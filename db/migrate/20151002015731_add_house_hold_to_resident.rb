class AddHouseHoldToResident < ActiveRecord::Migration
  def change
    add_reference :residents, :household, index: true, foreign_key: true
  end
end
