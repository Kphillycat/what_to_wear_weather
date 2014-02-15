require 'open-uri'
require 'json'
require "yaml"

class Weather

	def self.get_weather(latlng)
		keys = YAML::load_file("data/keys.yml")
		# API docs here https://developer.forecast.io/docs/v2
		# Check if timezone is in DB, forecast_parsed["timezone"]
		forecast_io_json = open("https://api.forecast.io/forecast/#{keys["FIO"]}/#{latlng}").read
		forecast_parsed = JSON.parse(forecast_io_json)
		forecast_parsed["daily"]["data"][0] #Today. 

	end
end