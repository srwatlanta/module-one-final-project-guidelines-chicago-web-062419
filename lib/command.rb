
def greeting 
    puts 'Welcome to FlightHub, your best vacation planning resource.' 
end 

# helper method to give us the ability to take user input and call inside other methods for the menus and submenus  

def input
    gets.chomp.downcase
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
        3. Back To Main Menu
    HISTORY_OF_FLIGHTS_MENU
puts history_of_flights_menu
end 

def destination_info_menu
    menu_for_destinations <<-MENU_FOR_DESTINATIONS
    Please enter the number next to the category you would like to explore.
        1. most popular destination
        2. highest rated destination 
        3. most popular terrain
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
    puts "please select a valid option"
end