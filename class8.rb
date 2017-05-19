module Ventas
	PI = "hola"
	class Customer
		def initialize(name, orders)
			@name = name
			@orders = orders
		end
	end
end

module Insurance
	PI = 68
	class Customer
		def initialize(name, period)
			@name = name
			@period = period
		end
	end
end


# Cuando se ejecutan clases con nombres iguales y métodos iguales, la última que se evalúa sobreescribe la primera, para evitar esto se usan namespaces

class Order
	include Ventas
	include Insurance
	attr_reader :products

	def initialize(products)
		@products = products
	end

	def self.PI
		Ventas::PI
	end
end

class Order
	attr_reader :details

	def initialize(details)
		@details = details
	end
end


# Errores

raise "Hola como estan" #
raise StandardError.new "Hello class"
raise StandardError, "Hello class"

fail "Falle al escribir" # Es preferible usar siempre para errores raise

class MyCustomError < StandardError
	
end

def it_will_blow_up
	# raise "Me exploté"
	# 6 / 0
	raise MyCustomError.new "Fallo in condicional"
end

begin
	it_will_blow_up
rescue RuntimeError => error
	puts "RUNTIME_ERROR=#{error.message} #{error.backtrace}"
# rescue StandardError => error
# 	puts "STANDARD_ERROR=#{error}"
rescue MyCustomError => error
	puts "MY_CUSTOM_ERROR=#{error}"
else
	puts "Segimos normal"
end

begin
	# it_will_blow_up
	text = gets.chomp
	if text == "incorrect"
		raise MyCustomError.new "No esperaba #{text} esperaba correct"
	end
rescue RuntimeError => error
	puts "RUNTIME_ERROR=#{error.message} #{error.backtrace}"
# rescue StandardError => error
# 	puts "STANDARD_ERROR=#{error}"
rescue MyCustomError => error
	puts "MY_CUSTOM_ERROR=#{error}"
else
	puts "Segimos normal"
end


def open_file(file)
	File.open(file)
end

def printer(file)
	while line = file.readline
		puts "LINE = #{line}"
	end
end

file_name = gets.chomp
file = open_file file_name

begin
	printer file
rescue EOFError => error
	puts "Ya llegamos al final del archivo #{error}"
else
	puts "Closing file"
	file.close
end






class NotYesOrNoError < StandardError; end

def accept_or_not
	puts "¿Desea aceptar?(y/n):"
	text = gets.chomp

	raise NotYesOrNoError.new("We expect y/n and you enter: #{text}") unless text == "y" || text == "n"

end


3.times do
	begin
		accept_or_not

	rescue NotYesOrNoError => error
		puts "Error #{error}"
	else
		puts "Todo bien"
		break
	end
end


module DB
	class UserNotFoundError < StandardError
		
	end

	class Usuario
		@@usuarios = []		

		attr_reader :email

		def initialize(email)
			@email = email
		end

		def save
			@@usuarios << self
		end

		def self.find(email)
			usuario = @@usuarios.find { |usuario| usuario.email == email }
			raise UserNotFoundError.new("User with email= #{email} does not exist") unless usuario
			usuario
		end
	end
end

begin
	DB::Usuario.find("ye@ah.com")
rescue DB::UserNotFoundError => error
	puts "Error #{error}"
end





