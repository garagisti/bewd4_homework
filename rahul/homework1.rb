
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

# Check if the Guess is correct
def is_guess_correct(guess,secret_number)

	if guess == secret_number
		true
	else
		false
	end

end


# Intros
#   - Welcome the player to your game. Let them know who created the game.
#   - Ask for the player's name then personally greet them by printing to the screen, "Hi player_name!"
#   - Any good game will communicate the rules. Let the player know they must guess a number between 1 and 10
#   and that they only have 3 tries to do so.
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
puts '############'
puts 'Let\'s Play'
puts '############'
puts ''
puts 'Now enter a number between 1 and 10'


# Set or Generate the variables for the game
guess_count = 0
max_guess_attempts = 3
secret_number = generate_random_number

# Debug statements
# puts "The Secret Number is: #{secret_number}"

# While we have attempts left, let's play
while guess_count < max_guess_attempts do


	# Take the initial input from the user
	puts "You have #{max_guess_attempts-guess_count} Attempts remaining."
	puts '=>'
	guess = get_input_from_player.to_i

	if is_guess_correct(guess, secret_number)
		puts "Yess!! CONGRATULATIONS! You guessed it!!"
		puts ''
		puts '############'
		puts 'GAME OVER'
		puts '############'
		break

	else
		puts "Whoops, that's not it."
		# increment guess counter
		guess_count +=1

	end

end


#
# We're ready to program! To practice our Ruby skills lets create a secret number game.
# In this game players have three tries to guess a secret number between 1 and 10.
#
# Here are some guidelines to building your game:
#
# Intros
#   - Welcome the player to your game. Let them know who created the game.
#   - Ask for the player's name then personally greet them by printing to the screen, "Hi player_name!"
#   - Any good game will communicate the rules. Let the player know they must guess a number between 1 and 10
#   and that they only have 3 tries to do so.
#
# Functionality:
#  -  Hard code the secret number. Make it a random number between 1 and 10.
#  -  Ask the user for their guess.
#  -  Verify if they were correct. If the player guesses correctly they win the game they should be congratulated and the game should end.
#  -  If they guess incorrectly, give the player some direction. If they guess too high let them know, if they guess too low, let them know.
#  -  Don't forget to let your players know how many guesses they have left. Your game should say something like
#     "You have X many guesses before the game is over enter a another number"
#  -  If they don't guess correctly after 3 tries, print that the Player lost and the game is over. Also let them know what the `secret_number` was.
#
# Make sure to add helpful comments to your code to document what each section does.
#
# Remember to cast input from the Player into the appropriate data type.
#
###############################################################################