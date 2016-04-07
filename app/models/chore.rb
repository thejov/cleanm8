class Chore < ApplicationRecord
  has_one :household
  has_many :cleanings

  validates_presence_of :name
  validates_presence_of :household_id
end
