class Weather::Weather
  attr_accessor :data, :temp, :city, :wind

    def initialize(hash)
        @data = hash["data"][0]
    end
    
    def temp
      
    end

    def city
      
    end

    def wind
      
    end
end

# @data["data"][0]["ob_time"] time and date