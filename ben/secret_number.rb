
# Secret Number v0.2 Game developed by Daniel Baker

### Game data

# Get players name
def player_name
  user_input = gets.chomp
  user_input.to_s
end

def play_game(secret_number)

  # Set loop range
  range = (1..3)

  # Start look
  range.each do |i|

    # Conditionals for pluralisation
    if i == 1
      puts 'What is your guess?'
    elsif i == 3
      puts 'What is your final guess?'
    else
      puts 'What is your next guess?'
    end

    # Grab player guess
    player_guess = gets.chomp
    guess = player_guess.to_i
    guess

    # Test player guess vs secret number
    if guess != secret_number
      if guess < secret_number && i < 3
        puts "Your guess of #{guess} is too low, try again."
      elsif guess > secret_number && i < 3
        puts "Your guess of #{guess} is too high, try again."
      elsif i == 3
        # End game if player runs out of guesses
        puts "Game over. The correct answer was #{secret_number}."
      end
    else
      puts "#{guess} is correct! You have won this round."
      # Break loop if answer is correct
      break
    end

    # Math for guess count
    guesses = 3 - i

    # Conditionals for pluralisation
    if guesses == 1
      puts "You have #{guesses} guess left."
    elsif guesses == 0
      # nothing
    else
      puts "You have #{guesses} guesses left."
    end

  end

end

# Set secret number
secret_number = rand(1..10)

# Game welcomes + introductions
puts 'Welcome to Secret Number, a game developed by Daniel Baker'

puts 'The rules are simple. You have 3 chances to guess a randomly generated number between 1 and 10'

puts 'What is your name?'

puts "Hello, #{player_name}!"

# Start loop
play_game(secret_number)


