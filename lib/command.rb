def welcome
  welcome_banner
  greeting
  menu_main
end

def menu_main
  puts `clear`
  puts ascii.asciify("FlightHub")
  main_menu_input = main_menu
  case main_menu_input
  when "Book a Flight"
    menu_1
  when "Flight History"
    menu_2
  when "Destination Info"
    menu_3
  when "Exit"
    goodbye
  end
end

def menu_1
  book_menu_input = book_flight_menu
  book_flight_banner
  case book_menu_input
  when "Pick a Destination"
    user_id = sign_in
    destination_id = pick_destination
    user = find_user(user_id)
    user.create_flight(destination_id)
    user.flight_confirmation
    more_help
  when "Destination Info"
    menu_3
  when "Back to Main Menu"
    menu_main
  when "Exit"
    goodbye
  end
end

def menu_2
  flight_history_banner
  user_id = sign_in
  user = find_user(user_id)
  history_menu_input = flight_history_menu
  case history_menu_input
  when "My Flights & Destinations"
    flight_history_banner
    user.my_flights
    more_help
  when "My Favorite City Types"
    flight_history_banner
    user.terrain_to_string
    more_help
  when "Back to Main Menu"
    menu_main
  when "Exit"
    goodbye
  end
end

def menu_3
  destination_menu_input = destination_info_menu
  case destination_menu_input
  when "Most Popular Destinations"
    destination_banner
    Flight.most_visited
    sleep(1)
    book_flight_from_most_visited_list
  when "Highest Rated Destinations"
    destination_banner
    Destination.highest_rated
    sleep(1)
    book_flight_from_highest_rated_list
  when "Star Rating by City Type"
    destination_banner
    Destination.average_terrain_rating
    more_help
  when "Back to Main Menu"
    menu_main
  when "Exit"
    goodbye
  end
end

def greeting
  puts "Welcome to FlightHub, your best vacation planning resource."
end

# helper method to give us the ability to take user input and call inside other methods for the menus and submenus

def input
  gets.chomp.to_i
end

# primary menu upon greeting customer, gives option of selection which presents sub menus

def main_menu
  prompt.select("Please select a category you would like to explore.", ["Book a Flight", "Flight History", "Destination Info", "Exit"])
end

def book_flight_menu
  puts `clear`
  puts ascii.asciify("Book Flight")
  prompt.select("Please select a category you would like to explore.", ["Pick a Destination", "Destination Info", "Back to Main Menu", "Exit"])
end

def flight_history_menu
  flight_history_banner
  prompt.select("Please select a category you would like to explore.", ["My Flights & Destinations", "My Favorite City Types", "Back to Main Menu", "Exit"])
end

def destination_info_menu
  destination_banner
  prompt.select("Please select a category you would like to explore.", ["Most Popular Destinations", "Highest Rated Destinations", "Star Rating by City Type", "Back to Main Menu", "Exit"])
end

def find_user(input)
  Passenger.find(input)
end

def pick_destination
  choices = Destination.list
  selection = prompt.select("Choose a destination from the list", choices)
end

def pick_destination_from_list
  puts "Please pick a destination from the list above and input the corresponding number."
  gets.chomp.to_i
end

def sign_in
  puts "Please sign in by entering your User ID number: "
  x = gets.chomp.to_i
  if x < 1 || x > 500
    puts "Please enter valid User ID"
  else
    x
  end
end

def error
  puts "Please select a valid option. Returning to previous menu."
end

def main_error
  puts "Please Select a Valid Option"
  menu_main
end

def welcome_banner
  puts `clear`
  puts ascii.asciify("Welcome")
end

def thank_you_banner
  puts ascii.asciify("Thank You")
end

def flight_history_banner
  puts `clear`
  puts ascii.asciify("Flight History")
end

def destination_banner
  puts `clear`
  puts ascii.asciify("Destinations")
end

def book_flight_banner
  puts `clear`
  puts ascii.asciify("Book Flight")
end

def prompt
  TTY::Prompt.new
end

def ascii
  Artii::Base.new
end

def goodbye
  puts `clear`
  puts ascii.asciify("Goodbye!")
end

def more_help
  sleep(2)
  puts `clear`
  puts ascii.asciify("FlightHub")
  more_help_input = prompt.select("Is there anything else I can do for you?", ["Yes", "No"])
  case more_help_input
  when "Yes"
    menu_main
  when "No"
    goodbye
  end
end

def book_flight_from_most_visited_list
  book_from_list_input = prompt.select("Would you like to book a flight to one of these destinations?", ["Yes", "No"])
  case book_from_list_input
  when "Yes"
    user_id = sign_in
    user = find_user(user_id)
    destination_id = pick_destination_from_list
    case destination_id
    when 1
      user.create_flight(Flight.most_visited_id[0])
      user.flight_confirmation
      more_help
    when 2
      user.create_flight(Flight.most_visited_id[1])
      user.flight_confirmation
      more_help
    when 3
      user.create_flight(Flight.most_visited_id[2])
      user.flight_confirmation
      more_help
    else
      error
      sleep(3)
      menu_3
    end
  when "No"
    more_help
  end
end

def book_flight_from_highest_rated_list
  book_from_list_input = prompt.select("Would you like to book a flight to one of these destinations?", ["Yes", "No"])
  case book_from_list_input
  when "Yes"
    user_id = sign_in
    user = find_user(user_id)
    destination_id = pick_destination_from_list
    case destination_id
    when 1
      user.create_flight(Destination.highest_rated_id[0])
      user.flight_confirmation
      more_help
    when 2
      user.create_flight(Destination.highest_rated_id[1])
      user.flight_confirmation
      more_help
    when 3
      user.create_flight(Destination.highest_rated_id[2])
      user.flight_confirmation
      more_help
    else
      error
      sleep(3)
      menu_3
    end
  when "No"
    more_help
  end
end
