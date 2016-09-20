# encoding: UTF-8
require 'sinatra'
require 'httparty'

get '/' do
  addr     = URI.escape((params['url']) ? params['url'].gsub(' ', '+') : 'Av.+Pref.+Hirant+Sanazar%2C+631')
  url      = "http://maps.google.com/maps/api/geocode/json?address=#{addr}"
  response = HTTParty.get(url)
  parsed   = JSON.parse(response.body)['results']
  haml :index, format: :html5, locals: {result: parsed}
end
