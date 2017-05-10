puts 'Por favor ingrese el nombre del primer jugador'
jugador1 = gets.chomp

puts 'Por favor ingrese su puntaje'
player1 = gets.chomp.to_i

puts 'Por favor ingrese el nombre del segundo jugador'
jugador2 = gets.chomp

puts 'Por favor ingrese su puntaje'
player2 = gets.chomp.to_i

# puts 'Error invalid input' if player1 < 0 || player1 > 21
puts 'Error invalid input' unless player1 >= 0 && player1 <= 21
# is_in_range = player1 >= 0 && player1 <= 21
# puts 'Error invalid input' unless is_in_range
# puts 'Error invalid input' if !is_in_range
# puts is_in_range ? 'continue' : 'Error invalid input'


# puts 'Error invalid input' if player2 < 0 || player2 > 21
puts 'Error invalid input' unless player2 >= 0 && player2 <= 21

if player1 > player2
	puts "Jugador #{jugador1} ganó con puntaje de #{player1}"
elsif player2 > player1
	puts "Jugador #{jugador2} ganó con puntaje de #{player2}"
else
	puts "Hubo un empate"
end		