# Prints the intro message
def run_intro
  puts 'Welcome to secret number, authored by Shirren'
  puts 'Please tell us your name'
  player_name = gets.chomp
  puts "Hi #{player_name}!"
  puts 'Please guess a number between 1 and 10. You have 3 tries in total.'
end

# Ask a user for their guess and return it
def get_user_guess
  gets.chomp.to_i
end

# Set the secret number to be a random number between 1 and 10
secret_number = rand(1..10)
run_intro

2.downto(0) do |guesses_left|
  user_guess = get_user_guess
  if user_guess < secret_number
    puts "Your guess is too low"
  elsif user_guess > secret_number
    puts "Your guess is too high"
  else
    puts "Great guess"
    exit
  end
  puts "You have #{guesses_left} guesses before the game is over enter a another number" if guesses_left > 0
end

puts "Sorry, you lost! Correct value was #{secret_number}"
