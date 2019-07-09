require_relative '../config/environment'
require_relative '../lib/app/models/destination'
require_relative '../lib/app/models/passenger'
require_relative '../lib/app/models/flight'

greeting
main_menu
input
    if input == 1
        booking_menu
        input
        case input
        when 1
            Destination.list
            enter_destination_id
            desination = find_destination
            enter_passenger_id
            user = find_user
            user.create_flight(destination_id: destination.id, passenger_id: user.id)
            flight_confirmation
            main_menu
        when 2
            destination_menu
        when 3
            main_menu
        end
    elsif input == 2
        enter_passenger_id
        user = find_user
        flight_history_menu
        input
        case input
        when 1
            user.my_flights
            flight_history_menu
        when 2
            user.my_terrain_count
            flight_history_menu
        when 3 
            main_menu
        end
    elsif input == 3
        destination_menu
        input
        case input
        when 1
            Destination.most_popular
            destination_menu
        when 2
            Destination.highest_rated
            destination_menu
        when 3
            Destination.best_terrain
            destination_menu
        when 4
            main_menu
        end
    else
        "I'm sorry please select one of the menu options using a number!"
    end

<<<<<<< HEAD
=======

puts "HELLO WORLD"

>>>>>>> 4148e83c9629810a87619eafcd4f5e597bc75bcb
