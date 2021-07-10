class Race < ApplicationRecord
  has_many :people

  validates :kind, presence: true
end
