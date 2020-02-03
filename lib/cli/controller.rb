class Weather::WeatherController

    def run
      welcome
      options
    end
    

    def welcome
      user_input
      # binding.pry
      if @user_input_city_and_country.parsed_response == nil 
        puts "Invalid input"
        # binding.pry
        sleep 2 
        user_input
        # binding.pry
      end

      @location = Weather::Weather.new(@user_input_city_and_country)
    end

    def user_input 
      puts "Welcome to the Weather CLI app! Please enter the city name: "
      @city_name = gets.chomp

      puts "Please enter the country name for more accuracy: "
      @country = gets.chomp.upcase

      # I would've tried validating @city name and country but I have no idea how to verify if those inputs are legit
      @user_input_city_and_country = Weather::API.get_weather(@city_name, @country)
      # binding.pry
    end 



    def options
      if @user_input_city_and_country.parsed_response == nil
        return 
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
        @location.get_temperature
        options
      elsif @options_input == 'wind'
        @location.get_wind
        options
      elsif @options_input == 'alert'
        @location.get_alerts
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

  

    
end