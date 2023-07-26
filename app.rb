require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get("/square/new") do
  erb(:square)
end

get("/square/results") do
  @input = params.fetch("number")

  @results = @input.to_f ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:root)
end

get("/square_root/results") do
  @input = params.fetch("number")

  @results = @input.to_f ** 0.5
  erb(:root_results)
end
