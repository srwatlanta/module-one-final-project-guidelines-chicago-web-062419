class Passenger < ActiveRecord::Base
    has_many :flights
    has_many :destinations, through: :flights

    def full_name
        "#{self.first_name} #{self.last_name}"
    end
end