class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  has_many :bookings

  def formatted_date
    "#{departure_airport.code} to #{arrival_airport.code} | #{date.strftime('%B %e %Y, %l:%M %p')}"
  end
end
