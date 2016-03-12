class Chore < ApplicationRecord
  has_many :cleanings

  validates_presence_of :name
end
