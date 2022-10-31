class PassengerMailer < ApplicationMailer
  def flight_booked
    @booking = params[:booking]

    mail to: @booking.passengers.pluck(:email), subject: 'Successfully booked flight.'
  end
end
