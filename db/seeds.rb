require 'csv'

passenger_data = Array.new
flight_data = Array.new
destination_data = Array.new

CSV.foreach("db/csv/passengers.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
    passenger_data << row.to_hash
end

CSV.foreach("db/csv/flights.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
    flight_data << row.to_hash
end

CSV.foreach("db/csv/destinations.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
    destination_data << row.to_hash
end


passenger_data.each do |passenger|
    Passenger.create(first_name: passenger[:first_name], last_name: passenger[:last_name], age: passenger[:age], country: passenger[:country])
end


flight_data.each do |flight|
    Flight.create(destination_id: flight[:destination_id], passenger_id: flight[:passenger_id], carrier: flight[:carrier], nonstop: flight[:nonstop])
end


destination_data.each do |destination|
    Destination.create(city: destination[:city], rating: destination[:rating], average_temp: destination[:average_temp], terrain: destination[:terrain])
end

