require 'pry'
class Flight < ActiveRecord::Base
    belongs_to :passenger
    belongs_to :destination

# returns an array with # of flights going to each destination, ranks them by count, then reverses so the highest number is at the top 
 def self.destination_count
    counted_destination_ids = Flight.all.group('destination_id').count
    sorted_ids = counted_destination_ids.sort_by do |count,destination_id|
        destination_id
    end
    sorted_ids.to_a.reverse
 end 

 def self.most_visited
    city_array = []
    city_array_sorted = []
    x = Flight.destination_count.first(3)
    x.map do |destination_count|
        id = destination_count[0]
        destination = Destination.find(id)
        city_array << destination.city
    end
    city_array.each_with_index do |city, i|
        city_array_sorted << "#{i + 1}. #{city}"
    end
    city_array_sorted.join(" ")
 end 




end

# def self.highest_rated
# self.group('rating').order('count_all').limit(3).count
# end 