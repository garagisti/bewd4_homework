# Shirren: A good bit of programming Ben, please check your editor settings. Because
# the indentation was off I found reading the code to be a bit difficult.

number = rand(1..10)
num_guesses = 0

puts 'Welcome to the secret number game, this game was created by Ben Newsom'
puts 'What is your name?'
username = gets.chomp
puts "Hi there #{username}! You must guess a number between one and ten in this game, you will only have three tries to do so."

# Time to play the game
puts 'Please try and guess the secret number'

# Shirren: Would have preferred the use of X.downto(Y) instead here. The use of
# while, for, and other open ended loops are not favoured.
# Commence loop
loop do
	# Potion of code which asks for user's guess and accrues guesses to the guess counter.
	print "What is your guess? "
	guess = gets.chomp.to_i

	# Shirren: The use of a downto would have eliminated the need for this variable
	num_guesses = num_guesses + 1
	puts "Guess ##{num_guesses} = #{guess}"

	unless guess == number

	# Shirren: Please check your indendation. I found this code hard to read because
	# of the indentation issues
	# Message if unsuccessful and number of guesses is < 3, continues loop
	if guess > number
		# Shirren: Why not just puts 'Too high'
	message = "Too high"
	puts message
	puts "You have #{3 - num_guesses} guesses remaining"
	else
		# Shirren: Why not just puts 'Too low'
	message = "Too low"
	puts message
	puts "You have #{3 - num_guesses} guesses remaining"
	end

	# Message if successful, breaks loop
	else
	puts "You got it!"
	puts "It took you #{num_guesses} guesses."
	exit
	end

	# Message if unsucessful and number of guesses equals 3, breaks loop
	if num_guesses == 3
		message = "Too many guesses, you lose. The secret number was #{number}, better luck next time!"
		puts message
		exit
	end
end
