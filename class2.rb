veces = 5
numerador = 0

while numerador < veces
	print "Por favor ingresa un dato: "
	var = gets.chomp
	if var == "exit"
		break
	end
	puts "El dato ingresado es: #{var}"
	puts "El numerador está en = #{numerador}"
	numerador += 1
end


5.times do
	print "Por favor ingresa un dato: "
	var = gets.chomp
	break if var == "exit"	
	puts "El dato ingresado es: #{var}"
end

# 100.times { |variable|	puts variable unless variable.odd? }

100.times do |variable|
	puts variable unless variable.odd? 
end

# loop { puts "Hola mundo" }  #Se ejecuta hasta que se presione ctrl+c
loop do #Se ejecuta infinitamente hasta que se ingrese exit o se presiones ctrl+c
	print "Por favor ingresa un dato: "
	var = gets.chomp
	break if var == "exit"	
	puts "El dato ingresado es: #{var}"
end

# 20.upto(60) { |n| puts n }
20.upto(60) do |n|
	puts n
end

# 100.downto(0) { |n| puts n }
100.downto(0) do |n|
	puts n
end

clase = ["Cristian", "Simón", "Santiago", "Maria", "Ana"]
clase[-1]
clase[clase.length - 1]
clase.last
# clase.shift borra el primer elemento
# clase.pop borra el último elemento
# clase.push("m") agrega m al arreglo
a_to_z = ('a'..'z').to_a
3.times do
	a_to_z.pop
end

a_to_z.each { |m| puts m unless m != "m" }	# Sólo imprime la letra m
a_to_z.find { |m| m == "m" } # Devuelve la letra m después de buscarla

a_to_z.each_with_index do |letra, indice|
	puts "#{indice} - #{letra}" unless indice.even?
end

# a_to_z.each_with_index {|letra, indice|	puts "#{indice} - #{letra}" unless indice.even?}

juego = []
juego << ["Cristian", 10]
juego << ["Simón", 15]
juego << ["Maria", 30]
juego << ["Ana", 25]
juego << ["Pepe", 20]
puntajes = []

# juego.each do |variable|
# 	puntajes << variable[1]
# end

# puntajes = juego.map { |jugador| jugador[1] }

puntajes = juego.map do |jugador|
	jugador[1]
end

puntajes.max # Da el máximo puntaje del arreglo
puntajes.sort # Los ordena de menor a mayor
puntajes.sort.reverse # Los ordena de mayor a menor