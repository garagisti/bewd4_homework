# Shirren: Erik your if statements were missing a final end, remember to close
# of if's with an end. Please see my other comments below. Also please take
# a look at some of the other students. Please ask Ben or myself to run you
# through one of the solutions

puts 'Welcome to the Secret Number Game created by Erik'
puts 'What is your name?'

# Shirren: missing the .chomp to remove the end of line character
player_name = gets

# Shirren: Use string interpolation where possible so this line should be
# something like puts "Hi #{player_name}!"
puts 'Hi' + player_name + '!'
puts 'The game is easy, pick a number between 1 and 10 and if you get it right within 3 turns you Win'

# Shirren: To grab a random number you could have written the following
# x = rand(1..10)
x = 7

# Shirren: functions a, b and c are redundant. We use functions to eliminate
# duplication, if you look carefully at your 3 functions they are identical
# thereby making function b and c redundant
def a
	if a == x
		puts 'Congratulations you guessed the right number, you Win!'
	elsif a < x
		puts 'Sorry too low, try again'
	else
		puts 'Sorry that was wrong, try a lower number'
	end
end

# Shirren: I don't quite get this?
a = gets

puts 'You have two guesses left'

def b
	if b == x
		puts 'Congratulations you guessed the right number, you Win!'
	elsif b < x
		puts 'Sorry too low, try again'
	else
		puts 'Sorry that was wrong, try a lower number'
	end
end

# Shirren: I don't quite get this?
b = gets

puts 'One guess left'

def c
	if c == x
		puts 'Congratulations you guessed the right number, you Win!'
	else
		puts 'Sorry that was your last guess and it was incorrect the Secret Number was 7'
	end
end

# Shirren: I don't quite get this?
c = gets
