def welcome
    greeting
    menu_main
end

def menu_main
    main_menu
    main_menu_input = input
        case main_menu_input
        when 1
            menu_1
        when 2
            menu_2
        when 3
            menu_3
        else 
            main_error
        end
end

def menu_1
    book_flight_menu
    book_menu_input = input
    case book_menu_input
    when 1
        user_id = sign_in
        destination_id = pick_destination
        user = find_user(user_id)
        user.create_flight(destination_id)
        user.flight_confirmation
    when 2
        menu_3
    when 3
        menu_main
    else 
        error
        menu_1
    end
end

def menu_2
    user_id = sign_in
    flight_history_menu
    user = find_user(user_id)
    history_menu_input = input
    case history_menu_input
    when 1
        user.my_flights
    when 2
        # user.my_terrain_count
    when 3
        menu_main
    else 
        error
        menu_2
    end
end

def menu_3
    destination_info_menu
    destination_menu_input = input
    case destination_menu_input
    when 1
        Flight.most_visited
    when 2
        Destination.highest_rated
    when 3
        Destination.average_terrain_rating
    when 4
        menu_main
    else 
        error
        menu_3
    end
end


def greeting 
    puts 'Welcome to FlightHub, your best vacation planning resource.' 
end 

# helper method to give us the ability to take user input and call inside other methods for the menus and submenus  

def input
    gets.chomp.to_i
end 

# primary menu upon greeting customer, gives option of selection which presents sub menus 

def main_menu 
    menu_guide = <<-MENU
    How can I help you? Please enter the number next to the category you would like to explore.
    1. Book a Flight 
    2. Flight History 
    3. Destination Info 
MENU
puts menu_guide 
end 


def book_flight_menu
    flight_menu = <<-FLIGHT_MENU
    Please enter the number next to the category you would like to explore.
    1. Pick a Destination 
    2. Destination Info 
    3. Back to Main Menu 
FLIGHT_MENU
puts flight_menu 
end 

def flight_history_menu
    history_of_flights_menu = <<-HISTORY_OF_FLIGHTS_MENU
    Please enter the number next to the category you would like to explore.
        1. My Flights & Destinations 
        2. Terrains You've Visited
        3. Back to Main Menu
    HISTORY_OF_FLIGHTS_MENU
puts history_of_flights_menu
end 

def destination_info_menu
    menu_for_destinations = <<-MENU_FOR_DESTINATIONS
    Please enter the number next to the category you would like to explore.
        1. Most Popular Destinations
        2. Highest Rated Destinations
        3. Average Terrain Star Rating
        4. Back to Main Menu
    MENU_FOR_DESTINATIONS
puts menu_for_destinations
end 

def find_user(input)
    Passenger.find(input)
end

def pick_destination
    puts "Please pick a destination from the list below and input the corresponding number."
    puts Destination.list
    gets.chomp.to_i
end

def sign_in
    puts "please sign in by entering your User ID number"
    x = gets.chomp.to_i
    if x < 1 || x > 500
        puts "Please enter valid User ID"
    else
        x
    end
end

def error
    puts "Please Select a Valid Option"
end

def main_error
    puts "Please Select a Valid Option"
    menu_main
end