def display_rules
	puts "Here are the rules to play the game:"
	puts "1. You must guess a number between 1 to 10."
	puts "2. You only have 3 tries to do so."
	puts "Let's begin the game!"
end

def welcome_user
  puts '###############################################################################'
  puts '#'
	puts '# 	SECRET GAME'
	puts '# Welcome! This game is developed by Rohini Rana'
	puts '#'
	puts '###############################################################################'
	puts "What's your name?"
	user_name = gets.chomp
	puts "Hi #{user_name}!"
end

# gets the input from the user
def get_input
	user_input = gets.chomp
  user_input.to_i
end

# check if the input is valid
def if_valid(num)
	if num >= 1 && num <= 10
		true
	else
		false
	end
end

secret = 8

welcome_user
display_rules

(1..4).each do |trial|
	if trial == 4 then
		puts "Sorry! You have lost the game. The Secret number was #{secret}"
		break
	else
		puts 'You have ' + (4 - trial).to_s + ' guesses before the game is over. Enter a number.'
		guess = if_valid
		if check_input(guess) then
			if guess == secret then
				puts "CONGRATULATION!!! You have won the game!"
				break
			elsif guess > secret
					puts "Sorry! Your guessed number is too high."
			else
					puts "Sorry! Your guessed number is too low."
			end
		else
			puts "You must guess a number between 1 to 10."
		end
	end
end
