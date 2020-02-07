class Weather::Weather
  attr_accessor  :temp, :city, :wind_spd
  # refactor initialize method to use ruby's #send method to assign attributes
    def initialize(hash)
        data = hash["data"][0]
        # binding.pry
        data.each do |key, value|
          begin 
            self.send("#{key}=", value)
          rescue 
          end 
        end 
    end
end

# @data["data"][0]["ob_time"] time and date