class BookingsController < ApplicationController
  def new
    @booked_flight = Flight.find_by(id: params[:booked_flight][:id]) 
  end
end
