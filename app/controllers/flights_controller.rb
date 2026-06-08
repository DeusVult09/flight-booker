class FlightsController < ApplicationController
  def index
    @airports = Airport.all
  end

  private 
  def flights_params
    params.expect(flight: [ :start_time, :departure_airport_id, :arrival_airport_id, ])
  end
end
