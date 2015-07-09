def display_rules
	puts "Here are the rules to play the game:"
	puts "1. You must guess a number between 1 to 10."
	puts "2. You only have 3 tries to do so."
	puts "Let's begin the game!"
end

# Shirren: In Ruby there is a construct called a heredoc which is best suited for
# multiline statements
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
# Shirren: Ruby functions which return a true of false are generally named with
# a question mark at the end so this function would be better named valid?
# You will see this more when we get into Rails
def if_valid(num)
	if num >= 1 && num <= 10
		true
	else
		false
	end
end

# Shirren: better is a random number generator was used like rand(1..10)
# which generates a number between 1 and 10.
secret = 8

welcome_user
display_rules

(1..4).each do |trial|
	if trial == 4 then
		puts "Sorry! You have lost the game. The Secret number was #{secret}"
		break
	else
		# Shirren: Better to use string interpolation here like you've  used in line 44
		puts 'You have ' + (4 - trial).to_s + ' guesses before the game is over. Enter a number.'
		guess = get_input

		# Shirren: The interpreter allowed the then but there is not then in an if statement
		# Also from purely a code readability standpoint I find this confusing. I initially
		# thought if_valid checks if the user guessed correctly. But because I can see
		# the implementation of if_valid above, all was well, but imagine if this was a
		# larger program? So a better name would have been correct_range?
		if if_valid(guess) then
			if guess == secret then
				puts "CONGRATULATION!!! You have won the game!"
				break
			elsif guess > secret
				# Shirren: Always use 2 spaces for a tab not 4
					puts "Sorry! Your guessed number is too high."
			else
					puts "Sorry! Your guessed number is too low."
			end
		else
			puts "You must guess a number between 1 to 10."
		end
	end
end
