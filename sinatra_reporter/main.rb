lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "sinatra"
require "sinatra/reloader" if development?
require "makeitreal"

users = [
	Makeitreal::Models::User.new( "aaa@aaa.com", "popo perez", "admin"),
	Makeitreal::Models::User.new( "bbb@bbb.com", "ana mana", "user"),
	Makeitreal::Models::User.new( "ccc@ccc.com", "coco loco", "developer")
]

get "/" do
	erb :index
end

get "/generate_report" do
	content = Makeitreal::Reporters::Users::Csv.generate(users)
	content_type "application/csv"
	attachment "users_report2.csv"
	content
end

get "/create_repor" do
	file = Makeitreal::Reporters::Users::Csv.report(users)
	send_file(file.path, disposition: :attachment, type: "application/csv")
end

get "/upload_file" do
	erb :upload_file
end

post "/upload_file" do
	# puts "File = #{params}"
	tempfile = params[:file][:tempfile]
	filename = params[:file][:filename]
	filename = params[:text] + "." + filename
	upload_path = File.join(".", "uploads", filename)
	# File.file? "./main.rb"
	
	File.open(upload_path, "wb") { |file| file.write(tempfile.read) }
end