class Weather::Weather

  attr_accessor :city_name, :timezone

    def initialize(hash)
      if hash == nil 
        return
      else
        @data = hash["data"][0]
        binding.pry
      end

    end

    def get_temperature
      if @data == nil
        return 
      else 
        puts "The temperature for #{@data["city_name"]} is #{@data["temp"]} degrees Celsius."
      end
    end

    def get_wind 
      puts "The wind speed is #{@data["wind_spd"]} meters per second."
    end
end

# @data["data"][0]["ob_time"] time and date