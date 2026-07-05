class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    @passengers_num = params[:passengers_number]
  end

  def create

  end

  def show

  end
end
