class Resident < ActiveRecord::Base
  has_many :grocery
  belongs_to :household
  validates :username, presence: true
end
