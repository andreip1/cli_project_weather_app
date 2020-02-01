require_relative "./project/version"
require 'pry'
require 'httparty'
require_relative './weather.rb'
require_relative './controller.rb'
require_relative './api.rb'

module Weather
    class Error < StandardError; end
      # Your code goes here...
end
  