class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @flights = Flight.all

    @flight_dates = @flights.map(&:start_time)
    @flight_date_formatted = @flight_dates.map { |f| f.strftime(('%A, %B %e (%Y)'))}.uniq
  end
  

  # def flights_params
  # params.expect(flight: [ :start_time, :departure_airport_id, :arrival_airport_id, ])
  # end
end
