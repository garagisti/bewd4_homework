
###############################################################################
#
# Back-End Web Development - Homework #1
# BY Rahul Bose schu82@gmail.com
#
# This is a Secret Number game built as homework for BEWD. 
# The purpose of the game is to have players guess a secret number from 1-10.
#
###############################################################################

# Functions
###############################################################################

# Get the name of the player
def get_input_from_player
	user_input = gets.chomp
end

# Generate a Random Number
def generate_random_number
	random_number = 1 + rand(10)
end

# Check if the Guess is correct, 
def is_guess_correct(guess,secret_number)

	if guess == secret_number
		true
	else
		false
	end

end

# Provide the user a hint of whether they are
# higher or lower than the secret number.
def provide_user_hint(guess,secret_number)

	if guess > secret_number
		puts 'Lower, your guess was too high.'
	else
		puts 'Higher, your guess was too low.'
	end
end

# Let the user know what the outcome of the game was.
def print_game_outcome(user_wins_game,secret_number)

	if user_wins_game
		puts "Yess!! CONGRATULATIONS! You guessed it!!"
	else
		puts 'Sorry! Unfortunately you didn\'t guess the Secret Number!'
		puts "The Secret Number was: #{secret_number}"
end
		puts ''
		puts '############'
		puts 'GAME OVER'
		puts '############'
		puts ''
end



# Intro Messages
###############################################################################
# This section gets Welcomes the user, gets their name and proivdes the rules
# of the game.

puts ''
puts '#########################################'
puts 'Welcome to Rahul\'s Number Guessing Game!'
puts '#########################################'
puts ''
puts 'What is your name?'
puts '=>'
puts "Hi #{get_input_from_player}!!"
puts ''
puts 'So the name of the game is to guess a secret number between 1 and 10'
puts 'You get three (3) shots at guessing it!'
puts ''  



# Variables
###############################################################################
# Set or Generate the variables for the game
guess_count = 0
max_guess_attempts = 3
user_wins_game = false;
secret_number = generate_random_number



# Debug Statements
###############################################################################
# Debug statements to be used while debugging for issues

# puts "The Secret Number is: #{secret_number}"


# Main Logic
###############################################################################
puts '############'
puts 'Let\'s Play'
puts '############'
puts ''
puts 'Now enter a number between 1 and 10'

# While we have Guess Attempts left, let's play
while guess_count < max_guess_attempts do


	# Tell the user how many guesses they have remaining
	puts "You have #{max_guess_attempts-guess_count} Attempts remaining."
	puts '=>'

	# Get the guess and convert it to an integer.
	guess = get_input_from_player.to_i

	# if the guess is correct
	if is_guess_correct(guess, secret_number)

		# Then the user has won and set the user wins boolean to true
		user_wins_game = true
		
		#Break out of the while loop because we don't care how many guesses are left
		break

	else
		puts "Whoops, that's not it."
		
		# Lets tell the user whether they were higher or lower than the secret number.
		provide_user_hint(guess, secret_number)

		# increment guess counter
		guess_count +=1
	end
end

# Finally print the out the result of the game
print_game_outcome(user_wins_game,secret_number)
