class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    @passengers_num = params[:passengers_number].to_i
  end

  def create
    @passengers_num.times do
      @booking.passengers.build
    end

    if @booking.save
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

end
