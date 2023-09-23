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
  @q = params.fetch("currency")
  @r = params.fetch("conversion")
  @x = HTTP.get("https://api.exchangerate.host/symbols")
  @t = HTTP.get("https://api.exchangerate.host/convert")
  @u = JSON.parse(@t)
  @y = JSON.parse(@x)
  @z = @y.fetch("symbols")
  @o = @z.fetch("AED")
  @w = "cool"
  url = "https://api.exchangerate.host/convert?from=USD&to=EUR"
  uri = URI(url)
  response = Net::HTTP.get(uri)
  response_obj = JSON.parse(response)
  {"from" => "USD",
    "to" => "EUR",
    "amount" => 1
  }

  erb(:conversion)
end
