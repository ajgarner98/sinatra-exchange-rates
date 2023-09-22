require "sinatra"
require "sinatra/reloader"
require "http"
require "json"




get("/") do
  @x = HTTP.get("https://api.exchangerate.host/symbols")
  @y = JSON.parse(@x)
  @z = @y.fetch("symbols")
  @o = @z.fetch("AED")
  erb(:home)
end
