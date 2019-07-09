class Destination < ActiveRecord::Base
    has_many :flights
    has_many :passengers, through: :flights

    def self.list
        self.all.each_with_index.map do |destination, i|
            "#{i + 1}. #{destination.city}"
        end
    end
    
end