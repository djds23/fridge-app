# == Schema Information
#
# Table name: groceries
#
#  id          :integer          not null, primary key
#  name        :string
#  quantity    :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  resident_id :integer
#

class Grocery < ActiveRecord::Base
  belongs_to :resident
  validates :name, presence: true
  validates :resident_id, presence: true
end
