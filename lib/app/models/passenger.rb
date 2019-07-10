class Passenger < ActiveRecord::Base
    has_many :flights
    has_many :destinations, through: :flights



    def create_flight(input)
        flight = Flight.new(:destination_id => input, :passenger_id => self.id)
        flight.carrier = ["American", "Delta", "Southwest", "United", "Spirit", "Jetblue"].sample
        flight.nonstop = [true, false].sample
        flight.save
    end

    def flight_confirmation
        puts "Thank you #{self.first_name}! Your flight has been booked and saved to your flight history."
    end

    def my_flights
        flight_array = []
        flight_list = []
        self.flights.each do |flight|
            destination = Destination.find(flight.destination_id)
            flight_array << "You flew to #{destination.city} via #{flight.carrier} airlines."
        end
        flight_array.each_with_index do |flight, i|
            flight_list << "#{i+1}. #{flight}"
        end
        puts flight_list.join(" ")
    end

    def my_terrains
        terrain_array = []
        self.flights.each do |flight|
            destination = Destination.find(flight.destination_id)
            terrain_array << destination.terrain
        end
        terrain_array
     end
     
     def terrain_count
        array = self.my_terrains
        counts = Hash.new(0)
        array.each do |terrain|
            counts[terrain] +=1
        end
        counts
     end
     
     def terrain_to_string
        array = []
        hash = terrain_count
        hash.each do |k,v|
            array << "#{k}: #{v}"
        end
        array.join(", ")
     end

end