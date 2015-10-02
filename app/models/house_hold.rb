class HouseHold < ActiveRecord::Base

  def residents
    Resident.where(household_id: id)
  end
end
