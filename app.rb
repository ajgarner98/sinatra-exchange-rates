require "sinatra"
require "sinatra/reloader"
require "http"
require "json"
require 'net/http'
require 'uri'

get("/") do
  @x = HTTP.get("https://api.exchangerate.host/symbols")
  @y = JSON.parse(@x)
  @z = @y.fetch("symbols")
  @o = @z.fetch("AED")
  erb(:home)
end

get("/:currency") do
  @q = params.fetch("currency")
  @x = HTTP.get("https://api.exchangerate.host/symbols")
  @y = JSON.parse(@x)
  @z = @y.fetch("symbols")
  @o = @z.fetch("AED")
  @t = HTTP.get("https://api.exchangerate.host/convert")
  @u = JSON.parse(@t)
  erb(:currency)
end

get("/:currency/:conversion") do
  @param_one = params.fetch("currency")
  @param_two = params.fetch("conversion")
  url = "https://api.exchangerate.host/convert?from=#{@param_one}&to=#{@param_two}"
  uri = URI(url)
  response = Net::HTTP.get(uri)
  @response_obj = JSON.parse(response)
  @converted_result = @response_obj.fetch("result")
  
  erb(:conversion)
end
