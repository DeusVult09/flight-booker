class Flight < ApplicationRecord
  validates :start_time, presence: true
  validates :duration, numericality: { greater_than: 0 }

  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
  has_many :bookings, dependent: :destroy

  def human_duration
    "#{duration / 60}h #{duration % 60}m"
  end
end
