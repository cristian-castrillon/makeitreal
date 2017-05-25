require "sinatra"

enable :sessions

products = [
	{name: "audifonos", price: 150, currency: "usd"},
	{name: "book", price: 30, currency: "usd"},
	{name: "mouse", price: 20, currency: "usd"},
	{name:"mac", price: 2300, currency: "usd"}
]

get "/" do
	@products = products

	@visited = request.cookies.fetch("visited", 0).to_i
	response.set_cookie "visited", @visited + 1

	erb :index
end

get "/products/new" do

	@visited = request.cookies.fetch("visited", 0).to_i
	response.set_cookie "visited", @visited + 1

	erb :products_new
end

post "/products/new" do
	name = params[:name]
	price = params[:price]
	currency = params[:currency]
	products.push({
		name: name,
		price: price,
		currency: currency
		})	

	redirect "/"
end

delete "/products/:name" do
	product = products.find do |product|
		product[:name] == params[:name]
	end

	return redirect "/" unless product

	products.delete product
	redirect "/"
end

get "/visited" do # cookies
	@visited = request.cookies.fetch("visited", 0).to_i
	response.set_cookie "visited", @visited + 1 # response.set_cookie("visited", @visited + 1)
	erb :visited
end

get "/login" do
	erb :login
end

post "/login" do
	if params[:email] == "" || params[:password] ==""
		@errors = [message: "Email or Password can't be blank"]
		return error(400, erb(:login))
	end
	unless params[:email] == "aaa@aaaa.com" && params[:password] =="abc123"
		@errors = [message: "Email or password does not match"]
		return error(401, erb(:login))
	end
	puts params[:email]
	response.set_cookie("email", params[:email])
	params[:email]
	redirect "/"
end



get "/products/:name" do
	name = params[:name]
	@product = products.find { |product| product[:name] == name}
	halt 404, "Product not found" unless @product
	erb :product
end

post "/cart" do
	product = params[:product]
	cart = session[:cart]
	if cart
		cart << product
	else
		cart = [product]
		session[:cart] = cart
	end

	redirect "/"
end