require "rails_helper"

RSpec.describe Booking, type: :model do
  describe "nested attributes"

  it "returns passengers created through nested attributes" do
      arrival = Airport.create!(code: 'KRK')
      departure = Airport.create!(code: 'WAW')

      flight = Flight.create!(arrival_airport: arrival, departure_airport: departure, start_time: Time.current,
      duration: 150)

      booking = Booking.create!(flight: flight, passengers_attributes: { "0" => { name: "Phil", email: "phil@bk.com"}})
    
      expect(booking.passengers.any?).to eq(true)
  end
end