[1, 2, 3, 4, 5]
:name
persona = {
	# 'name' => "Simón",
	:name => "Simón"
	1 => "Hola",
	[1, 2, 3, 4, 5] => "Equipo"
}

clase = {}
clase[:makeitreal] = ["Simón", "Chris"]

clase = [
	{:name => "Pedro", :last_name => "Martinez", :address => "Por ahí"},
	{:name => "Pablo", :last_name => "Rodriguez", :address => "En la calle"},
	{:name => "Maria", :last_name => "Mira", :address => "Bajo el puente"},
	{:name => "Ana", :last_name => "Gonzalez", :address => "En la montaña"},
	{:name => "Adolf", :last_name => "Hitler", :address => "En el cementerio"}
]

clase.each { |estudiante| puts "Estudiante #{estudiante[:name]} #{estudiante[:last_name]} vive #{estudiante[:address]}"}

{:name => "Nombre", :last_name => "Apellido", :address => "Dirección"}.delete(:name)

{:name => "Nombre", :last_name => "Apellido", :address => "Dirección"}.fetch "email", "Sin email"	# Imprime "Sin email" si no hay email

persona = {:name => "Nombre", :last_name => "Apellido", :address => "Dirección"}

persona.keys	# Regresa un array con las llaves

persona.values	# Regresa un array con los valores

states = {
	'Oregon' => 'OR',
	'Florida' => 'FL',
	'California' => 'CA',
	'New York' => 'NY',
	'Michigan' => 'MI'
}

cities = {
	'CA' => 'San Francisco',
	'MI' => 'Detroit',
	'FL' => 'Jacsonvile'
}

states.each do |state, value|
	puts cities.fetch(value, "#{state} no tiene ciudad")
end

libreta = [
	["email1", "Dirección1", "Teléfono1"],
	["email2", "Dirección2", "Teléfono2"],
	["email3", "Dirección3", "Teléfono3"]
]

llaves = [:email, :address, :phone]

libreta_contactos = []

libreta.each do |datos|
	# libreta_contactos << [llaves, datos].to_h
end



csv = <<-BEGIN
name,apellido,edad,cc
simon,escobar,25,12345
santiago,escobar,22,12345
maria,de los angeles,40,12345
BEGIN

print csv.gsub("\n", ",").reverse.sub(",","").reverse.split(",")

# p csv.split(/\n|,/)