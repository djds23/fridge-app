# == Schema Information
#
# Table name: residents
#
#  id           :integer          not null, primary key
#  username     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  household_id :integer
#

class Resident < ActiveRecord::Base
  has_many :grocery
  belongs_to :household
  validates :username, presence: true
end
