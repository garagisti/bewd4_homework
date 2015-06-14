puts 'Welcome to the Secret Number Game created by Erik'
puts 'What is your name?'
player_name = gets
puts 'Hi' + player_name + '!'
puts 'The game is easy, pick a number between 1 and 10 and if you get it right within 3 turns you Win'
x = 7

def a
	if a == x
		puts 'Congratulations you guessed the right number, you Win!'
	elsif a < x 
		puts 'Sorry too low, try again'
	else puts 'Sorry that was wrong, try a lower number'
end

a = gets

puts 'You have two guesses left'

def b
	if b == x
		puts 'Congratulations you guessed the right number, you Win!'
	elsif b < x 
		puts 'Sorry too low, try again'
	else puts 'Sorry that was wrong, try a lower number'
end

b = gets

puts 'One guess left'

def c
	if c == x
		puts 'Congratulations you guessed the right number, you Win!'
	else puts 'Sorry that was your last guess and it was incorrect the Secret Number was 7'
end

c = gets
