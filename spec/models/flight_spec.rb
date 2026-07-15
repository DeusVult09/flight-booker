require "rails_helper"

RSpec.describe Flight, type: :model do
  describe "#human_duration" do
    it "returns a human-readable duration" do
      flight = Flight.new(duration: 130)
      expect(flight.human_duration).to eq("2h 10m")
    end
  end

  
end