# puts 1, 'hola clase', 1.0

# nombre = gets
# puts 'Hola como estas', nombre
# p nombre

puts 'Por favor ingresa tu nombre: '
nombre = gets.chomp
# puts 'Hola como estas', nombre

puts 'Por favor ingresa por favor tu edad:'
edad = gets.chomp

puts "Hola #{nombre}", "Tu edad es: #{edad}"

numero1 = 45
numero2 = 50
numero3= 100

# resultado = numero1 + numero2 + numero3
# resultado = resultado / 3

resultado = (numero1 + numero2 + numero3)/3
puts "El promedio entre #{numero1}, #{numero2}, #{numero3} es #{resultado}"