class BookingsController < ApplicationController
  def new
    @booked_flight = Flight.find_by(id: params[:booked_flight][:id]) 
    @number_of_passengers = params[:booked_flight][:num_of_passengers].to_i
    @booking = Booking.new

    @number_of_passengers.times { @booking.passengers.build }
  end

  def create
    booking = Booking.create(booking_params)
    redirect_to booking_path(booking)
  end

  def show
    @booking = Booking.find_by(id: params[:id])
    @flight = @booking.flight
    @passengers = @booking.passengers
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
