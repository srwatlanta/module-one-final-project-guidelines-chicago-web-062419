require 'csv'

passenger_data = Array.new

CSV.foreach("seeds/passengers.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
    passenger_data << row.to_hash
end

p passenger_data