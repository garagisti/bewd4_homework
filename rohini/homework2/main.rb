# SDP: Good submission Rohini. Good to see the use of functions to grocery_or_supermarket
# functionality, but perhaps some of these methods would have been better placed
# in a class?
require 'json'
require 'rest-client'
require 'date'

require_relative 'lib/weather'

# displays list of cities
def display_city_choices
  # SDP: Please avoid the use of global variables, risky practice in ruby.
  # In the script simply declaring it as city_array at the top of the script
  # would have sufficed
  $city_array.each do |c|
    puts c
  end
end

# get user choice
def get_weather_choice
  puts "Do you wish to see current weather or 7 days forecast? Enter 1 or 2."
  puts "1. Current Weather"
  puts "2. 7 Days Weather Forecast"
  user_choice = gets.strip
end

# SDP: Nice function, like the use of a guard, please declare a function with
# brackets though
# validates the user's choice
def is_valid_weather_choice? user_choice
  true if user_choice == '1' || user_choice == '2'
end

# SDP Setting the variable is redundant here, just reutrning the computed
# value would have sufficed
# converts speed unit from m/s to km/h
def convert_speed_unit meter_speed
  km_speed = (meter_speed.to_f * 3.6).round(2)
end

# SDP: Again use brackets when declaring functions
# gets weather data from the external openweathermap api
def fetch_weather_data url
  rest_data = RestClient.get("#{url}")
  json_data = JSON.parse(rest_data)
  weather_data = json_data['list']
end

# creates and displays weather object
def create_display_weather weather_data, city, choice
  date_ctr = 0
  weather_data.each do |data|
    weather = Weather.new
    weather.description = data["weather"][0]["description"]
    if choice == '1'
      weather.max_temp = data["main"]["temp_max"]
      weather.min_temp = data["main"]["temp_min"]
      weather.humidity = data["main"]["humidity"]
      meter_speed = data["wind"]["speed"]
    else
      weather.max_temp = data["temp"]["max"]
      weather.min_temp = data["temp"]["min"]
      weather.humidity = data["humidity"]
      meter_speed = data["speed"]
    end
    weather.wind_speed = convert_speed_unit meter_speed

    date = (DateTime.now + date_ctr).strftime("%d/%m/%Y")

    puts "-----------------------------------"
    puts "#{city}: #{date}"
    puts "-----------------------------------\n \n"

    weather.view_weather
    date_ctr += 1
  end
end

# program starts here

# define global var city_array
$city_array = ['Adelaide', 'Brisbane', 'Canberra', 'Melbourne', 'Perth', 'Sydney']

puts "********************** Australian Weather Forecast ********************* \n \n"
puts "Get current weather or 7 days forecast of major cities of Australia \n \n"
puts "************************************************************************ \n \n"
puts "To begin, select a city from the list below. \n \n"


display_city_choices

selected_city = gets.strip.capitalize

if $city_array.include?(selected_city)
  weather_choice = get_weather_choice

  until is_valid_weather_choice? weather_choice do
    puts 'Sorry, not a valid input.'
    weather_choice = get_weather_choice
  end

  if weather_choice == '1'
    weather_url = "http://api.openweathermap.org/data/2.5/find?q=#{selected_city},au&units=metric"
    else
    weather_url = "http://api.openweathermap.org/data/2.5/forecast/daily?q=#{selected_city},au&cnt=7&units=metric"
  end
  weather_data = fetch_weather_data weather_url
  create_display_weather weather_data, selected_city, weather_choice
else
  puts "Sorry, we are unable to provide the weather information for #{selected_city}."
  puts "Thanks for using Australian Weather Forecast."
end
