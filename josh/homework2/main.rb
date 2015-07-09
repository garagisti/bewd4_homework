require './twilio'

# Twilio messaging enabled number
twilio_number = '+6140000000'

validation = false

# Welcome user and explain what the application does.
puts 'Welcome to BEWD Messenger! This tool will allow you to send SMS messages via the command line.'

# SDP: Reads a bit nicer to write while !valid
# The goal of Ruby was to facilitate more human readable code
while validation == false

	puts 'Please provide the mobile number of the person you wish to send a message to: '

	destination_number = gets.chomp

	# SDP: Would have been nice to put the number validator in a class
	# Check if number is valid
	if destination_number.length == 10 && destination_number[0] == '0'
		validation = true
	elsif destination_number.length == 12 && destination_number[0] == '+'
		validation = true
	else
		puts "Sorry you have not entered a valid Australian mobile phone number. The number must be 10 digits in length starting with a 0\n"\
			 "Alternatively the number can be 12 digits in legth starting with the country code (+61)\n"\
			 'Example: 0434 641 171 or +61434 641 171. Note: Cannot contain spaces'
	end
end

puts 'Thank you for the number. Now please write your messsage: '

message = gets.chomp

# SDP: Using an instance variable in a script is redundant. The are commonly used
# in classes only, recall our lesson on scope
# Send message to the destination number.
@client.messages.create(
 from: twilio_number,
 to: destination_number,
 body: message
)
