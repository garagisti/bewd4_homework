###############################################################################
#
# Secret Number Game
#
# Version: 1
# Author: Josh
# Class: BEWD4
# 
###############################################################################

# Begin Introduction
puts 'Welcome to the Secret Number game. This game was created by Josh Foreman.'

# Ask the player for their name, welcome them to the game and communicate the rules
puts 'To get started please enter your name: '
player_name = gets.chomp
puts "Welcome #{player_name}! \nThe rules of the game are simple. You will need to guess a number between 1 and 10. You will have only 3 attempts to guess the correct number, then the game is over. Good luck :)"

# Generate random number between 1 and 10
secret_number = 1 + rand(10)

# Commence loop allowing for 3 attempts
3.downto(1) do |attempts|

	# Ask the player for their input and cast the input to a number
	puts 'Please enter your guess: '
	player_guess = gets.chomp.to_i

	if secret_number == player_guess
		puts "Congratulations! You are correct, the number was indeed #{secret_number}. Thank you for playing."
		break
	elsif secret_number < player_guess && attempts > 1
		puts "You guessed too high, the number is less then that. You have #{attempts -1} attempt(s) remaining before the game is over. Try again :)"
	elsif secret_number > player_guess && attempts > 1
		puts "You guessed too low, the number is more then that. You have #{attempts -1} attempt(s) remaining before the game is over. Try again :)"
	else
		puts "Unfortunately you have lost. The secret number was #{secret_number}. Game over :("
	end
end