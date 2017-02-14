require 'net/http'
require 'json'
require 'pry'

uri = URI("https://api.darksky.net/forecast/0e856952938e2c29ecf72dfafa1ab6d6/41.252363,-95.997988")
rawData = Net::HTTP.get(uri)
weather = JSON.parse(rawData)
puts weather["daily"]["data"][7]["temperatureMin"]