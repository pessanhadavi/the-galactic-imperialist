class Planet < ApplicationRecord
  has_many :people

  validates :name, presence: true
end
