require 'pry'

class Destination < ActiveRecord::Base
    has_many :flights
    has_many :passengers, through: :flights

    def self.list
        self.all.each_with_index.map do |destination, i|
            "#{i + 1}. #{destination.city}"
        end
    end
    
    def self.highest_rating
        self.order(rating: :desc)
    end

    def self.highest_rated
        city_array = []
        self.highest_rating.first(3).each_with_index do |destination, i|
            city_array << "#{i + 1}. #{destination.city}"
        end
        puts city_array.join(" ")
    end 

    def self.average_terrain_rating
        average = []
     ratings = Destination.group(:terrain).average(:rating)
     ratings.each do |terrain, avg|
        average << "#{terrain.capitalize}: #{avg.round(2)}"
    end 
    puts average 
    end 
    
end 



