# == Schema Information
#
# Table name: groceries
#
#  id           :integer          not null, primary key
#  name         :string
#  quantity     :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  resident_id  :integer
#  purchased_at :time
#

class Grocery < ActiveRecord::Base
  belongs_to :resident

  validates :name, presence: true
  validates :resident_id, presence: true
  validates :quantity, inclusion: {
    in: [0, 1, 5]
  }

  scope :in_stock, -> { where('quantity = 5')}
  scope :running_low, -> { where('quantity = 1')}
  scope :out_of_stock, -> { where('quantity = 0')}

  module Quantites
    IN_STOCK     = 'In Stock'
    RUNNING_LOW  = 'Running Low'
    OUT_OF_STOCK = 'Out of Stock'
  end

  def status_hash
    {
      5 => :IN_STOCK,
      1 => :RUNNING_LOW,
      0 => :OUT_OF_STOCK,
    }
  end

  def options
    status_hash.map do |quantity, status|
      [Quantities.const_get(status), quantity]
    end
  end

  def status
    Quantites.const_get(status_hash[self.quantity])
  end

  def oos?
    self.quantity.zero?
  end
end
