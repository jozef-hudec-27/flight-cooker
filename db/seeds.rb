# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

airport_codes = ['ATL', 'DFW', 'DEN', 'ORD', 'LAX', 'CLT', 'MCO', 'LAS', 'PHX', 'MIA']

airport_codes.each do |airport_code|
  Airport.create(code: airport_code)
end

(airport_codes.length - 1).times do |i|
  Flight.create(departure_airport: Airport.find_by(code: airport_codes[i]),
                arrival_airport: Airport.find_by(code: airport_codes[i+1]),
                duration: rand(60..300),
                date: Time.now
              )
end