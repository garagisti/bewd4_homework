require_relative 'libs/Person'
require 'byebug'

# This validates a string input
# Get the name of the player

# Valid Username Regex
VALID_USER_NAME_REGEX = /[a-zA-Z]/
VALID_NUMBER_REGEX =  /\d/


# Make sure the entry isn't nill or empty
def validate_not_nil_or_empty(input)

  if input.nil? || input.empty?
    puts 'Please enter a non-empty or non-nil value.'
    false
  else
    true
  end
end

# Let's make sure the input is a string & not nil or empty
def validate_string_input(input)

  if !(VALID_USER_NAME_REGEX === input)
    puts 'Please enter valid characters (no numbers).'
    false
  else
    true
  end
end

# This validates a nubmer input
def validate_number_input(input)

VALID_NUMBER_REGEX === input

end


# This creates a Player
def create_player
  puts "Let\'s Get started. \n \n"
  puts "What is your Name? "
  puts "=> \n"

  # Seek & validate the input
  loop do user_input = gets.chomp
      if validate_not_nil_or_empty(user_input) && validate_string_input(user_input)
        return Person.new(user_input)
    end
  end
end

def play_game
loop do
  puts 'Do want to see what\'s making waves on Digg (press \'d\'), Mashable (press \'m\' or Twitter \'t\''
  puts 'Press \'q\' to Quit'
  puts '=>'

  response = gets.strip

    case response
    when "d"
      puts "getting news from Digg"
    when "m"
      puts "getting news from Mashable"
    when "t"
      puts "getting news from Twitter"
    when "q"
      puts "Quitting"
      break
    else
      puts "That wasn't one of the valid options..."
      puts "Try Again"
      puts "=>"
    end

end

end

# Main Programs call methods to run the program

puts "****************** Welcome to Rahuls MidTerm assignment ****************** \n \n \n"


puts 'This Program takes your input and runs data from an API'
puts 'The theme of this program is about \' What\'s Happening?\''

player = create_player

puts "\nNice to meet you #{player.name}! \n \n"

play_game

puts "\n############"
puts 'GAME OVER'
puts "############"




