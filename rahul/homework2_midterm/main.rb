require_relative 'libs/Person'
require_relative 'libs/Twitter'
require 'byebug'

# Valid Username Regex
VALID_USER_NAME_REGEX = /[a-zA-Z]/

# TWITTER API KEYS - TODO: Figure out how to generate these from user inputs
# instead of using the as global variables - very bad!
API_KEY = '134402524-vZ8WrtDUXm8l83kTtN0IMVqBrGpoVYxtiFCw74JR'
API_SECRET = 'odpdDneDFAoP4Tttdx7lKGjrPXYuMGQCO9PHw2blbTMYV'

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
# TODO: Redundant code & code duplication - see if you can combine with
# the validate not nill or empty function.
def validate_string_input(input)
  if !(VALID_USER_NAME_REGEX === input)
    puts 'Please enter valid characters (no numbers).'
    false
  else
    true
  end
end

# Process the responses and put them to the screen.
def process_twitter_response(responses)
  # TODO: if the response is not ok then write a message
  # if response.class ==
  # if the response is ok then proceed
  responses.each do |response|
    tweet = response['text']
    tweet_time = response['created_at']
    user = response['user']

    # Print the Tweet
    puts "Tweet by: #{user['name']}, Tweeted at: #{tweet_time} \n
     ==> #{tweet}\n"
  end
end

# Play Twitter with the given Api key and api secret
# TODO: convert this to take the user's generated key and token
def call_twitter
  twitter = Twitter.new(API_KEY, API_SECRET)
  process_twitter_response(twitter.call)
end

# This creates a Player
def create_player
  puts "Let\'s Get started. \n \n"
  puts 'What is your Name? '
  puts "=> \n"

  # Seek & validate the input
  loop do user_input = gets.chomp
    if validate_not_nil_or_empty(user_input) &&
       validate_string_input(user_input)
      return Person.new(user_input)
    end
  end
end

# Start the game
def play_game
  # Loop the game - consider if this is works for the game or not...
  loop do
    puts 'Do want to see what\'s making waves on Twitter? (press \'t\')'
    puts 'If not, Press \'q\' to Quit'
    puts '=>'
    response = gets.strip

    # Validate the input to make sure we haven't got
    if validate_not_nil_or_empty(response) && validate_string_input(response)
      if response.downcase == 'q'
        break
      elsif response.downcase == 't'
        # This is where we want to get the user's id and password to make the
        # Appropriate call via Twitter (ie for the user's data stream)

        # puts "What's your Twitter username?"
        # username = gets.chomp
        # puts "What's your Twitter password?"
        # password = gets.chomp

        # Now we play the game with the users input
        # TODO: Figure out how to convert the user's input to an API Key and API
        # secret.
        call_twitter
      else
        puts "Please enter a valid entry, \'t\' for Twitter or \'q\' to Quit \n"
      end
    end
  end
end

# Main Programs call methods to run the program
puts "************ Welcome to Rahuls MidTerm assignment ************ \n \n \n"

puts 'This Program takes your input and runs data from an API'
puts 'The theme of this program is about \' What\'s Happening?\''

# Instantiate a new Player
player = create_player

puts "\nNice to meet you #{player.name}! \n \n"

# Play the game
play_game

puts '\n############'
puts 'GAME OVER'
puts '############'
