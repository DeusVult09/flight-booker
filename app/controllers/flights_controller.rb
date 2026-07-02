class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @flights = Flight.all
    @flight_dates = @flights.map { |f| f.start_time.to_date }.uniq
   

    @search_flights = Flight.where(
      arrival_airport_id: params[:arrival_airport_id], 
      departure_airport_id: params[:departure_airport_id])
      .where(start_time: Date.parse(params[:start_time]).all_day)
  end


end
