class Weather::Weather
  attr_accessor  :temp, :city, :wind

    def initialize(hash)
        data = hash["data"][0]
        @temp = data["temp"]
        @city = data["city_name"]
        @wind = data["wind_spd"]
        # binding.pry
    end
    

end

# @data["data"][0]["ob_time"] time and date