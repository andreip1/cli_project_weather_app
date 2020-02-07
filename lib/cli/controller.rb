class Weather::WeatherController

  # attr_accessor :data, :get_temperature

    def run
      welcome
      options
    end
    

    def welcome
      user_input
      while @user_input_city_and_country.parsed_response == nil 
        puts "Invalid input"
        sleep 2 
        user_input
      end

      @location = Weather::Weather.new(@user_input_city_and_country)

    end

    def user_input 
      puts "Welcome to the Weather CLI app! "
      puts " "
      puts "Please enter the measurment units: C for Celsius, I for Imperial(Fahrenheit) "
      units_input = gets.chomp.upcase 
      units_checking(units_input)
      puts "Please enter the city name: "

      city_name = gets.chomp

      puts "Please enter the country name for more accuracy (optional): "

      country = gets.chomp.upcase


      @new_weather_instance = Weather::API.new
      @user_input_city_and_country = @new_weather_instance.get_weather(city_name, country, units_input)
    end 



    def options
      puts "What would you like to do? :"
      sleep 0.5
      puts " ----------------------------------------- "
      puts " ----------------------------------------- "
      puts "Get temperature - type in 'temp'"  
      puts " ======================================== "
      puts "Get Wind speed - type in 'wind'" 
      puts " ======================================== "
      puts "Get today's alerts - type in 'alert'" 
      puts " ======================================== "
      puts "To exit the application, type in 'exit'"  
      options_input = gets.chomp

      exit(options_input)  
      if options_input == 'temp'
        get_temperature
        options
      elsif options_input == 'wind'
        get_wind
        options
      elsif options_input == 'alert'
        get_alerts
        options
      else 
        puts 'Invalid input'
        options
      end
      
    end

    def exit(input)
      if input == 'exit'
        puts "Your program will exit in 1"
        sleep 1
        puts "Thanks for using the app!"
        abort
      end
    end
        
  def get_temperature 
    # binding.pry
    # units_checking
      puts "======================================================================================="
      puts "|| The temperature for #{@location.city} is #{@location.temp} degrees #{@fc}.    ||"
      puts "======================================================================================="
  end

  def get_wind 
    # units_checking
    puts "==============================================================="
    puts "|| The wind speed is #{@location.wind} #{@ws}. ||"
    puts "==============================================================="
  end

  def get_alerts
    alerts = @new_weather_instance.get_alerts
    # binding.pry
    if alerts["alerts"].length != 0 
      alerts["alerts"].each do |alert|
        puts "Retrieving information...please wait"
        puts " "
        sleep 2
        puts alert["description"]
        puts " "
      end
    else 
      puts "Retrieving information...please wait"
      puts " "
      sleep 2
      puts "==================="
      puts "| No alerts today |"
      puts "==================="
      puts " "
    end
  end

  def units_checking(input)
    if input == 'I'
      @fc = 'Fahrenheit'
      @ws = 'mph'
    else 
      @fc = 'Celsius'
      @ws = 'm/s'
    end
  end
end

