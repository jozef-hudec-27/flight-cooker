class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |airport| [airport.code, airport.code] }
    @passenger_options = [['One', 1], ['Two', 2], ['Three', 3], ['Four', 4]]

    flight_info = params[:flight]

    if flight_info
      departure_airport = Airport.find_by(code: flight_info.dig(:departure_airport_code))
      arrival_airport = Airport.find_by(code: flight_info.dig(:arrival_airport_code))

      year = flight_info.dig('date(1i)')
      month = flight_info.dig('date(2i)')
      day = flight_info.dig('date(3i)')
      date = Date.new(year.to_i, month.to_i, day.to_i)

      @number_of_passengers = flight_info.dig(:num_of_passengers)
      @flights = Flight.where(departure_airport: departure_airport, arrival_airport: arrival_airport, date: date.all_day)
    end
  end
end
