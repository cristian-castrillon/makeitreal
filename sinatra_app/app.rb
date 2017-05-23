require "sinatra"

# get '/' do
# 	@producto = "Hola variable de instancia"
# 	erb :index
# end

# get '/holamundo' do
# 	puts params
# 	"Hola mundo"
# end

# put '/acsdcas'

# post '/orders' do
# end

# get '/orders' do
# 	@orders = [
# 		{order_id: "o_aerf25",price: 5000 }
# 		{order_id: "a_aerf25",price: 5000 }
# 	]

# 	erb :orders
# end

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

