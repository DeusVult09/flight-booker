class Airport < ApplicationRecord
  validates :code, presence: true, uniqueness: true, length: { maximum: 3 }

  has_many :departing_flights, class_name: "Flight", foreign_key: "departure_airport_id", dependent: :destroy
  has_many :arriving_flights, class_name: "Flight", foreign_key: "arriving_airport_id", dependent: :destroy
end
