class Weather::Weather
  attr_accessor :data, :get_temperature

    def initialize(hash)
        @data = hash["data"][0]

    end


end

# @data["data"][0]["ob_time"] time and date