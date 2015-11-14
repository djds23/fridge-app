# == Schema Information
#
# Table name: categories
#
#  id            :integer          not null, primary key
#  house_hold_id :integer
#  name          :string
#  active        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Category < ActiveRecord::Base
  has_many :groceries
  belongs_to :house_hold
end

