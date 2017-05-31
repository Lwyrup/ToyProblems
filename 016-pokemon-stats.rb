require 'net/http'
require 'json'
require 'pry'

class Pokemon
	def initialize(name, speed)
		@name = name
		@speed = speed
	end

	def name()
		return @name
	end

	def speed()
		return @speed
	end
end

class PokeAPI
	def initialize()
		@baseURI = 'http://pokeapi.co/api/v2/'
	end

	def getPokemonById(numberOrName)
		uri = formatURI("pokemon/", numberOrName)
		massData = Net::HTTP.get(uri)
		return JSON.parse(massData)
	end

	def formatURI(slug, input)
		return URI(@baseURI + slug + input.to_s + '/')
	end
end

class UserInputs
	@input1
	@input2

	def ask
		puts "Enter the number of a pokemon."
		@input1 = Input.new( gets.chomp )
		checkInput(@input1)
		puts "Enter another number of a pokemon."
		@input2 = Input.new( gets.chomp )
		checkInput(@input2)
	end

	def values
		return [@input1.value, @input2.value]
	end

	private

	def checkInput( input )
		while !input.isValid?
			puts "Invalid input. Try again."
			input = Input.new( gets.chomp )
		end
	end
end

class Input
	def initialize( input )
		@value = input
		@isValid = !!matchesPattern(@value)
	end

	def value
		return @value
	end

	def isValid?
		return @isValid
	end

	private
	def matchesPattern(string)
	    return string =~ /(^[a-zA-Z]+$|^\d+$)/
	end
end

api = PokeAPI.new
inputs = UserInputs.new
inputs.ask()
data = inputs.values()
poke1JSON = api.getPokemonById( data[0] )
poke2JSON = api.getPokemonById( data[1] )

pokemon1 = Pokemon.new(poke1JSON["name"], poke1JSON["stats"][0]["base_stat"])
pokemon2 = Pokemon.new(poke2JSON["name"], poke2JSON["stats"][0]["base_stat"])

# compare stats
if pokemon1.speed > pokemon2.speed
	puts pokemon1.name + " is faster than " + pokemon2.name
elsif pokemon2.speed > pokemon1.speed
	puts pokemon2.name + " is faster than " + pokemon1.name
else
	puts pokemon1.name + " and " + pokemon2.name + " are the same speed"
end







