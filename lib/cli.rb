class CommandLineInterface
    # define all the methods of CLI in here 

    # greets the user

def greeting 
    puts 'Welcome to FlightHub, your best vacation planning resource.' 
end 


# helper method to give us the ability to take user input and call inside other methods for the menus and submenus  

def input
    gets.chomp
end 


# primary menu upon greeting customer, gives option of selection which presents sub menus 

def main_menu 
    menu_guide = <<-MENU
    Welcome to Flight Hub. How can I help you? Please pick a number next to the category you would like to explore."
    1. Book a Flight 
    2. Flight History 
    3. Destination Info 
MENU
puts menu_guide 
end 


def book_flight_menu
    flight_menu = <<-FLIGHT_MENU
    1. Pick a Destination 
    2. Destination Info 
    3. Back to Main Menu 
FLIGHT_MENU
end 
puts flight_menu 
end 

def flight_history_menu
    history_of_flights_menu = <<-HISTORY_OF_FLIGHTS_MENU
        1. My Flights & Destinations 
        2. my preferred terrain 
        3. back to main menu
    HISTORY_OF_FLIGHTS_MENU
end 
puts history_of_flights_menu
end 

def destination_info_menu
    menu_for_destinations <<-MENU_FOR_DESTINATIONS
        1. most popular destination
        2. highest rated destination 
        3. most popular terrain
    MENU_FOR_DESTINATIONS
end 
puts menu_for_destinations
end 








end 
cli.methods