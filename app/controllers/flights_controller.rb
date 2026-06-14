class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @flight_dates = flight_date_formatted.map { |date| date.strftime(('%A, %B %e (%Y)')) }
    
  end

  private

  def flight_date_formatted
    (Date.today..5.days.from_now).to_a
  end

  # def flights_params
  # params.expect(flight: [ :start_time, :departure_airport_id, :arrival_airport_id, ])
  # end
end
