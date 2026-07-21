class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @flights = Flight.all
    @flight_dates = @flights.map { |f| f.start_time.to_date }.uniq

    @flight_dates = Flight.none

    if params[:start_time].present?
      date = Date.parse(params[:start_time])
      
      @search_flights = Flight.where(
      arrival_airport_id: params[:arrival_airport_id], 
      departure_airport_id: params[:departure_airport_id],
      start_time: date.all_day)
    end    
  end
end
