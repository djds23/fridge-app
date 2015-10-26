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

  scope :in_stock, -> { where('quantity = 5') }
  scope :running_low, -> { where('quantity = 1') }
  scope :out_of_stock, -> { where('quantity = 0') }

  module Quantities
    IN_STOCK     = 'In Stock'
    RUNNING_LOW  = 'Running Low'
    OUT_OF_STOCK = 'Out of Stock'

    def self.status_hash
      {
        5 => :IN_STOCK,
        1 => :RUNNING_LOW,
        0 => :OUT_OF_STOCK,
      }
    end
  end

  Quantities.status_hash.each do |value, status|
    method_name = status.to_s.downcase << '?'
    define_method(method_name) do
      quantity == value
    end
  end

  def options
    Quantities.status_hash.map do |quantity, status|
      [Quantities.const_get(status), quantity]
    end
  end

  def status
    Quantities.const_get(
      Quantities.status_hash[quantity]
    )
  end

  def up_quantity!
    return false if in_stock?

    self.quantity = out_of_stock? ? 1 : 5
    self.save
  end

  def down_quantity!
    return false if out_of_stock?

    self.quantity = in_stock? ? 1 : 0
    self.save
  end
end

