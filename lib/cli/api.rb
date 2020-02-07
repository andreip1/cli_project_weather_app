class Weather::API
        
    def get_weather(city_name, country, units='C')
        @city_name = city_name
        @country = country
        @units = units
        @key = 'fa3ca35917764e51adbaab9dcb25b3a0'
        HTTParty.get("https://api.weatherbit.io/v2.0/current?city=#{@city_name}&country=#{@country}&key=#{@key}&units=#{@units}")
        # binding.pry
    end

    def get_alerts
        # binding.pry
        HTTParty.get("https://api.weatherbit.io/v2.0/alerts?city=#{@city_name}&country=#{@country}&key=#{@key}")

    end 
end





# BASE = 'https://api.weatherbit.io/v2.0/current'
# KEY = 'fa3ca35917764e51adbaab9dcb25b3a0'