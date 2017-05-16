class Persona
	def say_hello(name)
		puts "Hello my friend #{name}"		
	end

	# static
	def self.say_bye name
		puts "Bye my friend #{name}"
	end

	def get_secure_password
		password
	end

	# Los métodos privados se deberían escribir al final
	private
		def password
			puts "You can see my password"
		end

		def esto_es_privado
			puts "yayay"
		end
end

class Student
	def initialize(name, last_name, class_room)
		@name = name
		@last_name = last_name
		@class_room = class_room
	end

	def name
		@name
	end

	def class_room
		@class_room
	end

	def full_name
		"#{name} #{@last_name}"
	end


end

class ClassRoom
	@@students = []
	COUNTRY = "US"

	attr_reader :direccion	# Este el getter, no hay necesidad de definir la función para leer la variable, crea la variable de instancia
	attr_writer :telefono	# Este el setter, no hay necesidad de definir la función para escribir la variable, crea la variable de instancia
	attr_accessor :salon # Genera el getter y setter al mismo tiempo

	def initialize salon = "coeco"
		@salon = salon
	end

	def salon
		@salon.upcase
	end

	def add_student student
		@@students << student
	end

	def self.find student
		@@students.find { |e| e == student}
	end

	def self.students
		@@students
	end
end

class Orden
	attr_accessor :productos
	
	def initialize
		@productos = []
	end


	def productos= producto
		@productos << producto
	end


	def agregar_producto(producto)
		@productos << producto
	end

	def eliminar_producto(producto)
		@productos.delete(producto)
	end

	def encontrar_producto(producto)
		@productos.find { |p| p == producto }
	end
end


class Carta
	def initialize
		@card
	end
end

class Deck
	attr_reader :mazo
	def initialize
		@mazo = []
		1.upto(4) do |n|
			1.
		end
	end
end

class Jugador
	def initialize(name, hand)
		@name = name
		@hand = hand
	end
end

class Mano
	def initialize cards = []
		@hand = cards
	end

	def generar_mano
		
	end
end

class Juego
	def initialize players = []
		@players = players
	end
end