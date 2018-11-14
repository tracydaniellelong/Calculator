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
	erb :numbers, locals: {user_name: user_name}
end

post '/numbers' do
	operator = params[:operator]
	num1 = params[:num1]
	num2 = params[:num2]
	user_name = params[:user_name]
	redirect '/results?num1=' + num1 + '&num2=' + num2 + '&operator=' + operator + '&user_name=' + user_name
end

get '/results' do
	user_name = params[:user_name]
	operator = params[:operator]
	num1 = params[:num1].to_f
	num2 = params[:num2].to_f
	if operator == "add"
		total = add(num1, num2)
	elsif operator == "subtract"
		total = subtract(num1, num2)
	elsif operator == "multiply"
		total = multiply(num1, num2)
	else
		if num1 >= 1 && num2 >= 1
			total = divide(num1, num2)
		else
			total = 0
		end
	end
	erb :results, locals: {operator: operator, num1: num1, num2: num2, total: total, user_name: user_name}
end
