# puts 1, 'hola clase', 1.0

# nombre = gets
# puts 'Hola como estas', nombre
# p nombre

puts 'Por favor ingresa tu nombre: '
nombre = gets.chomp
# puts 'Hola como estas', nombre

puts 'Por favor ingresa por favor tu edad:'
edad = gets.chomp.to_i

puts 'Por favor ingresa tu género: '
genero = gets.chomp

puts "Hola #{nombre}", "Tu edad es: #{edad}"

numero1 = 45
numero2 = 50
numero3= 100

# resultado = numero1 + numero2 + numero3
# resultado = resultado / 3

resultado = (numero1 + numero2 + numero3)/3
puts "El promedio entre #{numero1}, #{numero2}, #{numero3} es #{resultado}"

if edad < 18	
	puts "Eres menor de edad, no puedes tomar cerveza"
elsif genero == 'mujer' && edad == 15
	puts 'Quinceañera'
else
	puts "Si puedes tomar cerveza"
end

puts 'Hola mundo' if edad == 0

puts 'Error: gender not found' if genero != 'hombre' && genero != 'mujer'