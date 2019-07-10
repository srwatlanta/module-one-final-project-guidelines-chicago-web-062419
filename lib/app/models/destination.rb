require 'pry'

class Destination < ActiveRecord::Base
    has_many :flights
    has_many :passengers, through: :flights

    def self.list
        self.all.each_with_index.map do |destination, i|
            "#{i + 1}. #{destination.city}"
        end
    end
    
    # helper method for self.most_popular_destinations
    def self.highest_rating
        self.order(rating: :desc)
    end

# not working :(, also there are 6 in the seeded data that are a 5 
    def self.highest_rated
        self.highest_rating.first(3)
    end 

    # def self.highest_rated_destinations_2
    #     self.group('rating').order('count_all').limit(3)
    # end 



    def self.average_terrain_rating
        average = []
     ratings = Destination.group(:terrain).average(:rating)
     ratings.each do |terrain, avg|
        average << "#{terrain}: #{avg.round(2)}"
        # binding.pry 
    end 
    average 
end 
    
end 

# Destination.where(terrain: 'beach').average(:rating)

