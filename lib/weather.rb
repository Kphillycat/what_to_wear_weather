require 'open-uri'
require 'json'
require "yaml"

class Weather

	def self.get_weather(latlng)
		keys = YAML::load_file("data/keys.yml")
		# API docs here https://developer.forecast.io/docs/v2
		# Check if timezone is in DB, forecast_parsed["timezone"]
		# Can check timezone with AskGEO since they might be free http://api.askgeo.com/v1/1031/4a21812ca44658976e3eca5a9b15ad7929ff4ab257d77cbf89f2c6233c6bc295/query.json?points=40.7178,-73.8812&databases=TimeZone
		forecast_io_json = open("https://api.forecast.io/forecast/#{keys["FIO"]}/#{latlng}").read
		forecast_parsed = JSON.parse(forecast_io_json)
		forecast_parsed["daily"]["data"][0] #Today. 
    minTemp = forecast_parsed["daily"]["data"][0]["apparentTemperatureMin"]
    case
      when minTemp < 30
        "winter"
      when minTemp > 30
        "spring"
    end
	end
end