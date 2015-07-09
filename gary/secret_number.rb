# Shirren: A very good effort Gary, my only feedback perhaps is to use a tool
# like Rubocop which will guide you a bit better on preferred Ruby syntax, I can
# see that your style of coding is very much Javaesque, but I am sure in time as
# you write more Ruby this will change :-)

###############################################################################
#
# Back-End Web Development - Homework #1
#
# Secret Number is a game you will build in two parts.
# The purpose of the game is to have players guess a secret number from 1-10.
#
# Read the instructions below.
# This exercise will test your knowledge of Variables and Conditionals.
#
###############################################################################
#
# We're ready to program! To practice our Ruby skills lets create a secret number game.
# In this game players have three tries to guess a secret number between 1 and 10.
#
# Here are some guidelines to building your game:
#
# Intros
#   - Welcome the player to your game. Let them know who created the game.
#   - Ask for the player's name then personally greet them by printing to the screen, "Hi player_name!"
#   - Any good game will communicate the rules. Let the player know they must guess a number between 1 and 10
#   and that they only have 3 tries to do so.
#
# Functionality:
#  -  Hard code the secret number. Make it a random number between 1 and 10.
#  -  Ask the user for their guess.
#  -  Verify if they were correct. If the player guesses correctly they win the game they should be congratulated and the game should end.
#  -  If they guess incorrectly, give the player some direction. If they guess too high let them know, if they guess too low, let them know.
#  -  Don't forget to let your players know how many guesses they have left. Your game should say something like
#     "You have X many guesses before the game is over enter a another number"
#  -  If they don't guess correctly after 3 tries, print that the Player lost and the game is over. Also let them know what the `secret_number` was.
#
# Make sure to add helpful comments to your code to document what each section does.
#
# Remember to cast input from the Player into the appropriate data type.
#
###############################################################################

# Show Welcome Message
def show_welcome_message
  puts 'Welcome to the Game of Guess The Number'
  # Shirren: If you want an added newline just add it to the original string
  # thereby eliminating an additional puts statement
  puts "Written by Gary Mann, May 2015\n\n"
  # puts ''
end

# Get the player's name
def get_player_name
  puts "Please enter your name:\n\n"
  # Shirren: Simplified this function
  gets.chomp
end

# Explain the rules to the player
def show_rules(player)

  # Shirren: For a multiline statement in Ruby there is something called a heredoc. Not
  # something we teach in the course, but would serve you well here
  puts "Hi #{player}"
  puts 'This game requires you to guess a number, which can be an integer from 1 to 10.'
  puts 'The target number is created randomly each time you run the game.'
  puts 'You get three attempts to enter the number.  If your entry matches the target number you win the game.'
  puts 'If your entry is wrong, you will be told whether it is above or below the target number, and how many more attempts you have left.'
  puts 'If you do not guess the number correctly after three attempts you lose the game.'
  puts 'If you enter a number below 1 or above 10 it will definitely be wrong.'
  puts ''
end

# Prompt the player to enter and number and return the entry
def get_user_guess(guess_count)
  puts "Enter attempt #{guess_count}:"
  guess = gets.chomp
  guess.to_i
end

def output_number_of_remaining_guess(remaining)
  if (remaining == 2)
    puts 'You have two remaining guesses.'
  elsif (remaining == 1)
    puts 'You have one remaining guess.'
  else
    puts 'You have no remaining guesses.'
  end
end

# test whether the player's entry is correct or not and display an appropriate message
def test_guess(user_guess, secret_number, maximum_guesses, guess_count)
  # Shirren: The brackets are redundant in Ruby
  if (user_guess == secret_number)
    puts ''
    true
  elsif (user_guess < secret_number)
    puts 'Sorry, that attempt was too low.'
    output_number_of_remaining_guess(maximum_guesses - guess_count)
    puts ''
    false
  else
    puts 'Sorry, that attempt was too high.'
    output_number_of_remaining_guess(maximum_guesses - guess_count)
    puts ''
    false
  end
end

# Display the final result of the game
def output_final_result_message(correct_number_found, player, secret_number)
  if correct_number_found
    puts "Well done #{player}, you have won the game!"
  else
    puts "Sorry #{player}, you have lost.  The correct number was #{secret_number}."
   end
end

# Main program
show_welcome_message
player = get_player_name
show_rules(player)

# Shirren: secret_number = rand(1..10)
secret_number = 1 + rand(10)

guess_count = 0

# Shirren: This is a constant so better to write
# MAXIMUM_GUESSES = 3
maximum_guesses = 3
correct_number_found = false

# Shirren: As mentioned in class the use of while and for loops are not common place
# in Ruby, an alternate way to write this code would have been to use either the
# range with an exit or a 3.times with an exit
while (!correct_number_found) && (guess_count < maximum_guesses)
  guess_count = guess_count + 1
  user_guess = get_user_guess(guess_count)
  correct_number_found = test_guess(user_guess, secret_number, maximum_guesses, guess_count)
end

# Shirren: Please add empty lines between groups of statements for improved
# legibility
output_final_result_message(correct_number_found, player, secret_number)
