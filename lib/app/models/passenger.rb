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

end