#Weather Class

class Weather
  attr_accessor :max_temp, :min_temp, :humidity, :description, :wind_speed

  def view_weather
    desc = @description.split.map(&:capitalize).join(' ')
    puts "#{desc}."
    puts "Maximum Temperature: #{@max_temp}˚C"
    puts "Minimum Temperature: #{@min_temp}˚C"
    puts "Humidity: #{@humidity}%"
    puts "Wind Speed: #{@wind_speed} km/h"
  end

end
