require 'sinatra'
require_relative 'math.rb'

get '/' do 
	erb :input
end

post '/input' do
	user_name = params[:user_name].capitalize
	redirect '/numbers?user_name=' + user_name
end

get '/numbers' do
	user_name = params[:user_name]
	operator = params[:operator]
	num1 = params[:num1]
	num2 = params[:num2]
	erb :numbers, locals: {user_name: user_name, operator: operator, num1: num1, num2: num2}
end

post '/numbers' do
	user_name = params[:user_name]
	operator = params[:operator]
	num1 = params[:num1].to_i
	num2 = params[:num2].to_i
	if operator == "add"
		total = add(num1, num2)
	elsif operator == subtract
		total = subtract(num1, num2)
	end
end