class Airport < ApplicationRecord
  validates :code, presence: true, uniqueness: true

  has_many :flights
end
