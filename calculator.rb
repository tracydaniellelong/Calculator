require 'sinatra'
require_relative 'math.rb'

get '/' do 
	erb :input
end

post '/input' do
	user_name = params[:user_name].capitalize
	#redirect '/numbers?user_name=' + user_name
end