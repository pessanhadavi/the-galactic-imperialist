class Person < ApplicationRecord
  belongs_to :planet
  belongs_to :race
  has_many :pilots
  has_many :starcrafts, through: :pilots
end
