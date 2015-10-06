# == Schema Information
#
# Table name: house_holds
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class HouseHold < ActiveRecord::Base

  def residents
    Resident.where(household_id: id)
  end
end
