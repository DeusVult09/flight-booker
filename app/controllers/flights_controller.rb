class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @flights = Flight.all

   

    @search_flights = Flight.where(
      arrival_airport_id: params[:arrival_airport_id], 
      departure_airport_id: params[:departure_airport_id]
      )
  end


end
