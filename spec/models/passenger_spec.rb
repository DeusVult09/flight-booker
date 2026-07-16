require "rails_helper"

RSpec.describe Passenger, type: :model do
  describe "validations" do
    it "returns an invalid Passenger without a name" do
      arrival = Airport.create!(code: 'TAS')
      departure = Airport.create!(code: 'WAW')

      flight = Flight.create!(arrival_airport: arrival, departure_airport: departure, start_time: Time.current,
      duration: 50)

      booking = Booking.create!(flight: flight)
      new_passenger = booking.passengers.create(name: nil, email: "passengers@bk.com")
      expect(new_passenger.valid?).to eq(false)
    end
  end

  describe "validations" do
    it "returns an invalid Passenger without an email" do
      arrival = Airport.create!(code: 'RIX')
      departure = Airport.create!(code: 'WAW')

      flight = Flight.create!(arrival_airport: arrival, departure_airport: departure, start_time: Time.current,
      duration: 60)

      booking = Booking.create!(flight: flight)
      new_passenger = booking.passengers.create(name: "Alex", email: nil)
      expect(new_passenger.valid?).to eq(false)
    end
  end
end