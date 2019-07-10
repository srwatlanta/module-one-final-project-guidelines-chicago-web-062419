require_relative '../config/environment'
require_relative '../lib/app/models/destination'
require_relative '../lib/app/models/passenger'
require_relative '../lib/app/models/flight'
require_relative '../lib/command.rb'

greeting
main_menu
menu_choice = input
    if menu_choice.to_i == 1
        book_flight_menu
        booking_choice = input
        if booking_choice.to_i == 1
            user_id = sign_in
            destination_id = pick_destination
            user = find_user(user_id)
            user.create_flight(destination_id)
            user.flight_confirmation
            main_menu
        elsif input == 2
            destination_info_menu
        elsif input == 3
            main_menu
        else error
        end
    elsif menu_choice.to_i == 2
        user_id = sign_in
        flight_history_menu
        user = find_user(user_id)
        history_choice = input
        if history_choice == 1
            user.my_flights
            flight_history_menu
        elsif history_choice == 2
    #         user.my_terrain_count
            flight_history_menu
        elsif history_choice == 3
            main_menu
        else error
        end
    elsif menu_choice == 3
        destination_info_menu
        destination_choice = input
        if destination_choice == 1
           Flight.most_visited
           destination_menu
        elsif destination_choice == 2
            Destination.highest_rated
            destination_menu 
        elsif destination_choice ==3
            Destination.average_terrain_rating
            destination_menu
        elsif destination_choice == 4
            main_menu
        else error
        end
    else error
    end

