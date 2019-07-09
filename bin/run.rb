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
            destination_menu
        else input == 3
            main_menu
        end
    # elsif input == 2
    #     enter_passenger_id
    #     user = find_user
    #     flight_history_menu
    #     input
    #     case input
    #     when 1
    #         user.my_flights
    #         flight_history_menu
    #     when 2
    #         user.my_terrain_count
    #         flight_history_menu
    #     when 3 
    #         main_menu
    #     end
    # elsif input == 3
    #     destination_info_menu
    #     input
    #     case input
    #     when 1
    #         Destination.most_popular
    #         destination_menu
    #     when 2
    #         Destination.highest_rated
    #         destination_menu
    #     when 3
    #         Destination.best_terrain
    #         destination_menu
    #     when 4
    #         main_menu
    #     end
    # else
    #     "I'm sorry please select one of the menu options using a number!"
    end

