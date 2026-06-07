class FlightsController < ApplicationController
  def index
    @flights = Flight.find_by(flights_params)
  end

  private 
  def flights_params
    params.expect(flight: [ :start_time, :duration, :departure_airport, :arrival_airport ])
  end
end
