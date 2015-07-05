# SDP: Good use of namespaces with the introduction of the lib folder. But the
# use of require_relative is somewhat uncommon, try and use require as a rule of
# thumb
require_relative 'libs/Person'
require_relative 'libs/Twitter'
require 'byebug'

# Valid Username Regex
VALID_USER_NAME_REGEX = /[a-zA-Z]/

# SDP: Traditionally this is solved by creating environment variables that
# can be set in your web host. Rails for example then has access to these
# env variables

# TWITTER API KEYS - TODO: Figure out how to generate these from user inputs
# instead of using the as global variables - very bad!
API_KEY = '134402524-vZ8WrtDUXm8l83kTtN0IMVqBrGpoVYxtiFCw74JR'
API_SECRET = 'odpdDneDFAoP4Tttdx7lKGjrPXYuMGQCO9PHw2blbTMYV'


# SDP: Semantically correct implementation, but the implementation could be
# a lot simpler, look at mine below. Also functions which return Boolean end
# in a question mark
def valid?(user_input)
  !input.nil? && !input.empty?
end

# Make sure the entry isn't nill or empty
def validate_not_nil_or_empty(input)
  # SDP: This empty line is not required

  if input.nil? || input.empty?
    puts 'Please enter a non-empty or non-nil value.'
    false
  else
    true
  end
end

# SDP: Not sure whether this is the best way of doing it. I would have removed
# the other function validate_not_nil_or_empty as I think it's redundant
# simply writing !VALID_USER_NAME_REGEX.match(input).nil?
def valid_alt?(input)
  !VALID_USER_NAME_REGEX.match(input).nil?
end

# Let's make sure the input is a string & not nil or empty
# TODO: Redundant code & code duplication - see if you can combine with
# the validate not nill or empty function.
def validate_string_input(input)
  # SDP: Again in Ruby this empty line is not required

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

    # SDP: Please indent the code in the block!
  tweet = response['text']
  tweet_time = response['created_at']
  user = response['user']

  #Print the Tweet
  puts "Tweet by: #{user['name']}, Tweeted at: #{tweet_time} \n ==> #{tweet}\n\n"
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
  puts "What is your Name? "
  puts "=> \n"

  # SDP: Please make sure your end statements match in terms of indentation

  # Seek & validate the input
  loop do user_input = gets.chomp
      if validate_not_nil_or_empty(user_input) && validate_string_input(user_input)
        return Person.new(user_input)
    end
  end
end


# SDP: I am not quite sure what the goal of this bit of code is.

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
        # TODO: Figure out how to convert the user's input to an API Key and API secret.
        call_twitter
      else
        puts "Please enter a valid entry, \'t\' for Twitter or \'q\' to Quit \n"
      end
    end
  end
end


# Main Programs call methods to run the program
puts "****************** Welcome to Rahuls MidTerm assignment ****************** \n \n \n"


puts 'This Program takes your input and runs data from an API'
puts 'The theme of this program is about \' What\'s Happening?\''

# Instantiate a new Player
player = create_player

puts "\nNice to meet you #{player.name}! \n \n"

# Play the game
play_game

puts "\n############"
puts 'GAME OVER'
puts "############"
