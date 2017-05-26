require "sinatra"
require "sinatra/reloader" if development?

enable :sessions

users = [{email: "simon@ex.com", password: "1234567890", permit: "download"}, {email: "popo@ex.com", password: "12345", permit: "read"}]

get "/" do
	@visited = request.cookies.fetch("visited", 0).to_i
	response.set_cookie "visited", @visited + 1
	erb :index
end
# Necesita enviar a index cuando se equivoque al logear
post "/" do
	email = params.fetch("email", "").strip
	password = params.fetch("password", "").strip
	if email.empty? || password.empty?
		@errors = [{message: "Email and Password can't be empty"}]
		return error(400, erb(:index))
	end
	# users.each do |user|
	# 	puts "#{email}  #{user[:email]}  #{password}  #{user[:password]}"
	# 	# unless email == user[:email] && password == user[:password]
	# 	# 	@errors = [{message: "Email and Password does not match"}]
	# 	# 	return error(401, erb(:index))

	# 	# end

	# 	if email == user[:email] && password == user[:password]
			
	# 		@permit = user[:permit]
	# 		break
	# 	end
	# end
	# puts @permit
	session[:current_customer] = {email: email}
	redirect "/files"
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
	redirect "/"
end