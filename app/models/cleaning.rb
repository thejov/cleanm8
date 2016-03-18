class Cleaning < ApplicationRecord
  belongs_to :chore
  belongs_to :user

  validates_presence_of :date
  validates_presence_of :chore_id
  validates_presence_of :user_id
end
