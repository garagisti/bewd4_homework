# Shirren: Could have used a random number generator here like follows
# correct_answer = rand(1..10)
CORRECT_ANSWER = 7
MAXIMUM_ATTEMPTS = 3

# Shirren: Nice use of a function here
def ask_user_for_answer
	puts "Muhahaha! So what is your guess?"
	guess = gets.chomp
	guess.to_i
end

# Shirren: nice!
def check_answer(answer)
	answer == CORRECT_ANSWER
end

puts "Welcome to The Riddler's Secret Game - created by Bill Finger"
puts "Who dares to play the Riddlers game?"

# Shirren: Not sure why we are flushing our output buffer?
STDOUT.flush

# Shirren: Avoid camel casing in Ruby
Who = gets.chomp

# Shirren: Better using string interpolation here
puts "Welcome dear" + Who + ". Prepare to be RIDDLED!!!."
puts "You will need to guess a number between 1 and 10 and you only have 3 tries to do so."

# attempt_count = 0

# Shirren: A construct like 3.downto(1) would have been better here. While, For and Do
# until are generally not used in Ruby code
while true do
	guess = ask_user_for_answer
	# attempt_count++

	if check_answer(guess)
		puts "Well done!"
		break
	else
		puts "try again! "
	end
end
