class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    @passengers_num = params[:passengers_number].to_i

    @passengers_num.times do
      @booking.passengers.build
    end
  end

  def create

    if @booking.save
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

end
