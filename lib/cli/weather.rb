class Weather::Weather
  attr_accessor :alerts

    def initialize(hash)
      if hash.parsed_response == nil 
        Weather::WeatherController.new.run
        return 
      else 
        @data = hash["data"][0]
        # binding.pry
      end
    end

    def get_temperature
      if @data == nil
        return 
      else 
        puts "======================================================================================="
        puts "|| The temperature for #{@data["city_name"]} is #{@data["temp"]} degrees Celsius.    ||"
        puts "======================================================================================="
      end
    end

    def get_wind 
      puts "==============================================================="
      puts "|| The wind speed is #{@data["wind_spd"]} meters per second. ||"
      puts "==============================================================="
    end

    def get_alerts
      @alerts = Weather::API.get_alerts
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

# @data["data"][0]["ob_time"] time and date