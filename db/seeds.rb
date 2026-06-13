# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


tas = Airport.create!(code: 'TAS')
rix = Airport.create!(code: 'RIX')
waw = Airport.create!(code: 'WAW')
krk = Airport.create!(code: 'KRK')

airports = [ tas, rix, waw, krk ]

8.times do
  departure = airports.sample
  arrival = (airports - [ departure ]).sample

  Flight.create!(
    start_time: rand(1..30).days.from_now,
    duration: rand(60..600),
    departure_airport: departure,
    arrival_airport: arrival
    )
end
