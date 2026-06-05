class Flight < ApplicationRecord
  validates :start_time, presence: true
  validates :duration, presence: true

  belongs_to :departure_airport
  belongs_to :arrival_airport
end
