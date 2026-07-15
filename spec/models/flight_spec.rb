require "rails_helper"

RSpec.describe Flight, type: :model do
  describe "#human_duration" do
    it "returns a human-readable duration" do
      flight = Flight.new(duration: 130)
      expect(flight.human_duration).to eq("2h 10m")
    end
  end

  describe "associations" do 
    it "returns its arrival airport and departure airport" do 
      arrival = Airport.create!(code: 'TAS')
      departure = Airport.create!(code: 'RIX')

      flight = Flight.create!(arrival_airport: arrival, departure_airport: departure)
      expect(flight.arrival_airport).to eq(arrival)
      expect(flight.departure_airport).to eq(departure)
    end
  end

end