class Figura

	def perimetro; end

	def lados; end

	def area; end
end

class Circulo < Figura
	attr_accessor :radio

	def initialize(radio)
		@radio = radio
	end

	def perimetro
		Math::PI * 2 * @radio
	end

	def lados
		1
	end

	def area
		Math::PI * (@radio ** 2)
	end
end

class Triangulo < Figura
	def initialize(base, lado1, lado2, altura)
		@base = base
		@lado1 = lado1
		@lado2 = lado2
		@altura = altura
	end

	def perimetro
		@base + @lado1 + @lado2
	end

	def lados
		3
	end

	def area
		(@base * @altura) / 2.0
	end
end

class Rectangulo < Figura
	attr_accessor :lado1, :lado2

	def initialize(lado1, lado2)
		@lado1 = lado1
		@lado2 = lado2
	end

	def perimetro
		2 * lado1 + 2 * lado2
	end

	def area
		lado1 * lado2
	end
end

class Cuadrado < Rectangulo; end

class CuadradoEspecial < Cuadrado
	def perimetro
		puts "Estás llamando al cuadrado especial"
		super
	end
end






class Compania
	# nombre, nit, empleados, dirección, accionistas, jefe, clientes, proveedores, proyectos
=begin
	def initialize(nombre, nit, direccion, jefe)
		@nombre = nombre
		@nit = nit
		@empleados = []
		@direccion = direccion
		@accionistas = []
		@clientes = []
		@proveedores = []
		@proyectos = []
		@jefe = jefe
	end
=end
	
	def initialize(datos_compania = {})
		@nombre = datos_compania[:nombre]
		@nit = datos_compania[:nit]
		@empleados = []
		@clientes = []
	end
	def contratar_empleado(empleado)
		@empleados << empleado
	end

	def despedir_empleado(empleado)
		@empleados.delete(empleado)
	end

	def hacer_convenio_cliente(cliente)
		@clientes << cliente
	end
end

class Persona
	# nombre, edad, cc, visa, email, genero, idioma
	def initialize(datos_persona = {})
		@nombre = datos_persona[:nombre]
		@edad = datos_persona[:edad]
		@cc = datos_persona[:cc]
		@visa = datos_persona[:visa]
		@email = datos_persona[:email]
		@genero = datos_persona[:genero]
		@idioma = datos_persona[:idioma]
		
	end
end

class Empleado < Persona
	# horario, sueldo, cargo, proyectos, skills
	def initialize(datos_empleado = {})
		super(datos_empleado)
		@horario = datos_empleado[:horario]
		@sueldo = datos_empleado[:sueldo]
		@cargo = datos_empleado[:cargo]
		@proyectos = datos_empleado[:proyectos]
		@skills = datos_empleado[:skills]
	end
end

class Cliente < Persona
	# credit_card, cuenta_bancaria, proyectos
	# def initialize(nombre, edad, cc, ... , credit_card, cuenta_bancaria, proyectos)
		# super(nombre, edad, ...)
		# @credit_card = credit_card
		# ...
	# end

	def initialize(datos_cliente = {})
		super(datos_cliente)
		@credit_card = datos_cliente[:credit_card]
		@cuenta_bancaria = datos_cliente[:cuenta_bancaria]
		@proyectos = datos_cliente[:proyectos]
	end
end

class Gerente < Empleado
	# documentos, areas
	def initialize(datos_gerente = {})
		super(datos_gerente)
		@documentos = datos_gerente[:documentos]
		@areas = datos_gerente[:areas]		
	end
end

class Desarrollador < Empleado
	# lenguajes, logros
	def initialize(daros_desarrollador = {})
		super(daros_desarrollador)
		@lenguajes = daros_desarrollador[:lenguajes]
		@logros = daros_desarrollador[:logros]
	end
	def cargo
		"Full Stack ninja #{super}"
	end
end

class Proveedor < Persona
	
end

class Accionista < Persona
	
end