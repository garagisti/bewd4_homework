CORRECT_ANSWER = 7
MAXIMUM_ATTEMPTS = 3

def ask_user_for_answer 
	puts "Muhahaha! So what is your guess?"
	guess = gets.chomp
	guess.to_i
end

def check_answer(answer)
	answer == CORRECT_ANSWER
end


puts "Welcome to The Riddler's Secret Game - created by Bill Finger"
puts "Who dares to play the Riddlers game?"  
STDOUT.flush  
Who = gets.chomp  
puts "Welcome dear" + Who + ". Prepare to be RIDDLED!!!."
puts "You will need to guess a number between 1 and 10 and you only have 3 tries to do so."

# attempt_count = 0

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