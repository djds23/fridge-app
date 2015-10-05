class Grocery < ActiveRecord::Base
  belongs_to :resident
  validates :name, presence: true
  validates :resident_id, presence: true
end
