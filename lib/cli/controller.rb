class Weather::WeatherController


    def run
      welcome
      options
    end
    

    def welcome
      puts "Welcome to the Weather CLI app! Please enter the city name: "
      city_name = gets.chomp

      puts "Please enter the country name for more accuracy: "
      country = gets.chomp.upcase

      user_input_city_and_country = Weather::API.get_weather(city_name, country)


      if user_input_city_and_country.parsed_response == nil 
        puts "Invalid input"
        sleep 2 
        user_input_city_and_country = nil
        self.run
      else
      @location = Weather::Weather.new(user_input_city_and_country)
      end
    end

    def options
      puts "Alerts for today: alert placeholder"
      sleep 1.2
      puts "What would you like to do? :"
      sleep 0.3
      puts "Get temperature - type in 'temp'"  
      puts "Get Wind speed - type in 'wind'"  
      puts "To exit the application, type in 'exit'"  

      # binding.pry
      input = gets.chomp 
      if input == 'temp'
        @location.get_temperature
      elsif input == 'wind'
        @location.get_wind
      elsif input == nil 
        puts 'Invalid input'
        return
      elsif input == 'exit' 
        puts "Your program will exit in 3"
        sleep 1 
        puts "2"
        sleep 1 
        puts "1"
        sleep 1
        return 
      end
      while input != 'exit'
        options 
      end
    end
    

end