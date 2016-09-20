require 'sinatra'
require 'httparty'

get '/' do
  url = (params["url"]) ? params["url"] : 'http://maps.google.com/maps/api/geocode/json?address=Av.+Pref.+Hirant+Sanazar%2C+631'
  response = HTTParty.get(url)
  parsed = JSON.parse(response.body)["results"]
  haml :index, format: :html5, locals: {result: parsed}
end
