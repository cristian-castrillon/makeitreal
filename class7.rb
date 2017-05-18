# Se debe escribir primero el módulo en este caso
module Greeting
	def hola
		"hola"
	end

	def hello
		"hello"
	end

	def bonjour
		"bonjour"
	end

	def hello_with_name
		"Hello #{name}"
	end

	def self.hola_with_class # self hace referencia al módulo, sólo lo puede usar el módulo, por ejemplo: Greeting.hola_with_class
		"Spr. hola"
	end
end

class Persona
	include Greeting # Incluye los métodos como métodos de instancia
	attr_reader :name, :email
	def initialize name, email
		@name = name
		@email = email
	end
end


module GreetingClass
	def hola
		"hola"
	end

	def hello
		"hello"
	end

	def bonjour
		"bonjour"
	end

	def hola_with_class
		"Spr. hola"
	end
end

class PersonaClass
	extend GreetingClass # Los métodos se extienden como métodos de clase, por ejemplo: PersonaClass.bonjour
	attr_reader :name, :email
	def initialize name, email
		@name = name
		@email = email
	end
end



module Inject
	
	def sum
		suma = 0
		each { |num| suma += num }
		suma
	end

	def prod
		producto = 1
		each { |num| producto *= num }
		producto
	end
end

class Array
	include Inject
end



class MakeItReal
	include Enumerator

	attr_accessor :estudiantes
	def initialize
		@estudiantes = []
	end

	def each
		@estudiantes.each do |estudiante|
			yield estudiante
		end
	end
end



module Authentication
	include Bcrypt

	def self.included(mod)
		puts "#{self} included in #{mod}"
		mod.extend ClassMethods
	end

	def password
		@password
	end

	def encrypt_password(password)
		@password = Password.create password # Password.create(password)
	end

	module ClassMethods
		def login?(user, password)
			user.password == password		
		end
	end
	
end

class Customer
	attr_reader :email
	def initialize(email, password)
		@email = email
		encrypt_password password
	end
end

module Order
	class Customer
		
	end
end

module Authentication
	class Customer
		
	end
end

or_cu = Order::Customer.new
au_cu = Authentication::Customer.new