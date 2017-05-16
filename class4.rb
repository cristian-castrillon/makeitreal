def sum(num1, num2)
	if num1 % 2 == 0
		return num1 - num2
	end
	num1 + num2
end

def say_hi name
	"Hola #{name}"
end

def sumatoria values, inicial = 0
	suma = inicial
	values.each do |value|
		suma += value
	end
	suma
end

def fetch hash, key, default = "Error"
	return default unless hash[key]	# nil es tratado como false
	hash[key]
end

def avg array
	average = 0.0
	array.each do |num|
		average += num
	end
	average / array.length
end

def avg values
	sum = values.reduce(:+)
	sum.fdiv values.length
end

def avg values
	sum = values.inject { |sum, value| sum + value}
	sum.fdiv values.length
end

def concat array1, array2
	concat = []
	array1.each { |value| concat << value }
	array2.each { |value| concat << value }
	concat
end

def concat! array1, array2
	array2.each { |value| array1 << value }
	array1
end

File
File.directory? '.' # Regresa true or false si existe el directorio
File.file? '.' # Regresa true or false si existe el archivo
File.expand_path '.' # Regresa el path actual expandido
File.expand_path '..' # Regresa el path del directorio padre o anterior expandido

new_file = File.new("auto_generated.rb", "w")
new_file.write("puts 'Hola mundo'")
new_file.close
File.open("auto_generated.rb", "w") { |io| io.write("Bye mundo") }
new_file = File.open("auto_generated.rb", "w")

def crea_archivo file_name, content 
	new_file = File.new(file_name, "w")
	new_file.write(content)
	new_file.close
end

def leer_archivo file_name
	return "Archivo no existe" unless File.exist?(file_name)
	text = ""
	File.open(file_name, "r") { |io| text = io.read }
	text
end