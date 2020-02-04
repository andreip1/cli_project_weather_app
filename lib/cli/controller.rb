class Weather::WeatherController

  attr_accessor :data, :get_temperature, :show_location

    def run
      welcome
      options
    end
    

    def welcome
      user_input
      # binding.pry
      while @user_input_city_and_country.parsed_response == nil 
        puts "Invalid input"
        # binding.pry
        sleep 2 
        user_input
        # binding.pry
      end

      @location = Weather::Weather.new(@user_input_city_and_country)
      # binding.pry
    end

    def user_input 
      puts "Welcome to the Weather CLI app! Please enter the city name: "
      @city_name = gets.chomp

      puts "Please enter the country name for more accuracy: "
      @country = gets.chomp.upcase

      # I would've tried validating @city name and country but I have no idea how to verify if those inputs are legit
      @new_weather_instance = Weather::API.new

      @user_input_city_and_country = @new_weather_instance.get_weather(@city_name, @country)
    

    end 



    def options
      # binding.pry

      if @user_input_city_and_country.parsed_response == nil
        puts "error message" 
      else  
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
      @options_input = gets.chomp
      # binding.pry
      if @options_input == 'exit'
        self.exit
      elsif @options_input == 'temp'
        get_temperature
        options
      elsif @options_input == 'wind'
        get_wind
        options
      elsif @options_input == 'alert'
        get_alerts
        options
      else 
        puts 'Invalid input'
        options
      end
    end
    end

    def exit
      # input = gets.chomp 
      if @options_input == 'exit'
        puts "Your program will exit in 1"
        sleep 1
        puts "Thanks for using the app!"
        return
      end
    end


  def show_location 

    @location.data
  end 
        
  def get_temperature 
      puts "======================================================================================="
      puts "|| The temperature for #{@location.data["city_name"]} is #{@location.data["temp"]} degrees Celsius.    ||"
      puts "======================================================================================="
  end

  def get_wind 
    puts "==============================================================="
    puts "|| The wind speed is #{@location.data["wind_spd"]} meters per second. ||"
    puts "==============================================================="
  end

  def get_alerts
    @alerts = @new_weather_instance.get_alerts
    # binding.pry
    if @alerts["alerts"].length != 0 
      @alerts["alerts"].each do |alert|
        puts "Retrieving information...please wait"
        puts " "
        sleep 3
        puts alert["description"]
        puts " "
      end
    else 
      puts "Retrieving information...please wait"
      puts " "
      sleep 3
      puts "==================="
      puts "| No alerts today |"
      puts "==================="
      puts " "
    end
  end



end

