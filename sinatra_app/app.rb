require "sinatra"

get '/' do
	# @producto = "Hola variable de instancia"
	erb :index
end

# get '/holamundo' do
# 	puts params
# 	"Hola mundo"
# end

# put '/acsdcas'

# post '/orders' do
# end

get '/orders' do
	@order = {}

	@orders = [
		{order_id: "o_aerf25",price: 5000 },
		{order_id: "a_aerf25",price: 5000 }
	]

	@orders.each do |order|
		@order = order if order[:order_id] == params[:search]
	end

	erb :orders
end

# delete '/orders/:order_id' do
# end

# get '/orders/:order_id' do
# 	puts "ORDER ID=#{params[:order_id]}"
# end

get '/customers' do
	@customers = [{nombre: "Amon", edad: 22, email: "al@gg.com"}, {nombre: "Gades", edad: 24, email: "bb@yy.com"}]
	@email = params[:email]
	@customer = {}
	@customers.each do |customer|
		@customer = customer if customer[:email] == @email
	end
	puts @customer
	erb :customers
end

get "/foo" do
	# request.user_agent # Obtiene el browser o cliente usado
	puts "AGENT = #{request.user_agent}"
	puts "URL = #{request.url}"
	puts "PORT = #{request.port}"
	puts "METHOD = #{request.request_method}"
	puts "IP = #{request.ip}"
	puts "HTTP_ACCEPT = #{request.env['HTTP_ACCEPT']}"
	puts "SERVER_PORT = #{request.env['SERVER_PORT']}"
	puts "HTTP_USER_AGENT = #{request.env['HTTP_USER_AGENT']}"
	puts "REQUEST_METHOD = #{request.env['REQUEST_METHOD']}"
	puts "==" * 10
	puts "#{request.env}"
end

get "/login" do
	erb :login
end

post "/login" do
	# puts "Email = #{params[:email]}"
	# puts "Password = #{params[:password]}"
	# "Success"
	# if params[:password] == "abc123"
	# 	redirect "/user_account/#{params[:email]}"
	# else
	# 	erb :login
	# end
	if params[:email] == "" || params[:password] ==""
		@errors = [message: "Email or Password can't be blank"]
		return error(400, erb(:login))
	end
	unless params[:email] == "aaa@aaaa.com" && params[:password] =="abc123"
		@errors = [message: "Email or password does not match"]
		return error(401, erb(:login))
	end
	redirect "/user_account/#{params[:email]}"
end

get "/user_account/:email" do
	@email = params[:email]
	erb :account
end