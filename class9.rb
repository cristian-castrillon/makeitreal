def dividir_numeros

	print "Ingrese el primer número: "
	num1 = gets.chomp.to_i
	print "Ingrese el segundo número: "
	num2 = gets.chomp.to_i

	raise ZeroDivisionError.new("No se puede división por cero") if num2 == 0

	puts num1 / num2
	
end

loop {
	begin
		dividir_numeros
		print "Ingrese 'exit' para salir: "
		salir = gets.chomp
	rescue ZeroDivisionError => error
		puts "Error #{error}"
	else
		break if salir == "exit"
	end
}

# def get_text
# 	print "$"
# 	text = gets.chomp
# end

class EmptyNameError < StandardError; end

class Under18Error < StandardError; end

def sign_up
	puts "Ingrese nombre del usuario:"
	nombre = gets.chomp
	raise EmptyNameError.new("Nombre no puede ser vacio") if nombre =~ /^\s*$/ #nombre.strip.empty?
	puts "Ingrese su edad:"
	edad = gets.chomp
	raise Under18Error.new("Menor de 18") unless Integer(edad) >= 18
	# Integer(edad)
end

begin
	sign_up
rescue EmptyNameError => error
	puts "Error #{error}"
rescue Under18Error => error
	puts "Error #{error}"
end


module Dojo
	A = 4

	module Kata
		module Roulette
			class ScopeIn
				def push
					A
				end
			end
		end
	end
end


Dojo::Kata::Roulette:ScopeIn.new.push  # Para ver la constante A

# Todavía no funciona
class Mazo
	extend Enumerable

	@@cartas = [{pinta: "corazones", palo: "A"}, {pinta: "corazones", palo: "2"}, {pinta: "corazones", palo: "3"}]

	def self.each
		@@cartas.each do |carta|
			yield carta
		end
	end

	def self.find(pinta, palo)
		# @@cartas.find { |carta| carta == {pinta: pinta, palo: palo} }
		find { |carta| carta == {pinta: pinta, palo: palo} }
		# find carta == {pinta: pinta, palo: palo}
	end
end