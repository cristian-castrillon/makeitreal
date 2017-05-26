require "sinatra"
require "sinatra/reloader" if development?

enable :sessions

users = [{email: "simon@ex.com", password: "1234567890", permit: "download"}, {email: "popo@ex.com", password: "12345", permit: "read"}]

get "/" do
	

	unless request.cookies.fetch("email", "").empty?
		session[:current_customer] = {email: request.cookies.fetch("email", "")}
		return redirect "/files"
	end
	@visited = request.cookies.fetch("visited", 0).to_i
	response.set_cookie "visited", @visited + 1
	erb :index
end
# Necesita enviar a index cuando se equivoque al logear
post "/" do
	@tries = request.cookies.fetch("tries", 0).to_i
	if request.cookies["max_tries"]
		@errors = [{message: "Maximo de intentos alcanzados, por favor intente en 60 segundos"}]
		return error(403, erb(:index))
	end
	if @tries >= 3
		response.set_cookie("tries", 0)
		response.set_cookie("max_tries", value: true, expires: Time.now + 60)

	end

	email = params.fetch("email", "").strip
	password = params.fetch("password", "").strip
	login = 0
	if email.empty? || password.empty?
		# @errors = [{message: "Email and Password can't be empty"}]
		# return error(400, erb(:index))
		
		response.set_cookie("tries", @tries + 1)
		return redirect "/"
	end

	users.each do |user|
		# puts "#{email}  #{user[:email]}  #{password}  #{user[:password]}"
		# unless email == user[:email] && password == user[:password]
		# 	@errors = [{message: "Email and Password does not match"}]
		# 	return error(401, erb(:index))

		# end

		if email == user[:email] && password == user[:password]
			
			# @permit = user[:permit]
			login = 1
			break
		end
	end
	if login == 1
		session[:current_customer] = {email: email}

		if params[:remember_me] == "true"
			# puts params[:remember_me]
			response.set_cookie("email", email)
			response.set_cookie("password", password)
		end
		return redirect "/files"
	else
		
		response.set_cookie("tries", @tries + 1)
		return redirect "/"
	end
	# puts @permit
	
end

get "/files" do
	unless session[:current_customer]
		return redirect "/"
	end
	
	users.each do |user|
		@permit = user[:permit] if user[:email] == session[:current_customer][:email]
	end


	entries = Dir.entries(".")
	@directories = entries.select { |entry| File.directory? entry }
	@files = entries.select { |entry| File.file? entry }
	erb :files
end

get "/files/:name" do
	# File.read(params[:name])
	send_file params[:name], disposition: :inline
end

get "/download/:name" do
	
	send_file params[:name], disposition: :attachment
end

get "/logout" do
	session.clear
	response.set_cookie("email", "")
	response.set_cookie("password", "")
	redirect "/"
end