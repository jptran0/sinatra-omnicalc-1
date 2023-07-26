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

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  apr_input = params.fetch("apr").to_f.round(4)
  @apr = apr_input.to_s(:percentage, { :precision => 4 })

  @years = params.fetch("years").to_i
  principal = params.fetch("principal").to_f
  @pv = principal.to_s(:currency)

  rate = ( apr_input / 12.0 ) / 100
  n = -1 * (@years * 12)
  numerator = rate * principal
  denominator = 1 - (1 + rate ) ** n
  # 27.1
  @payment = (numerator / denominator).to_s(:currency)

  erb(:payment_results)
end
