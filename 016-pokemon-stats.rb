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
		createInput( @input1 )
		puts "Enter another number of a pokemon."
		createInput( @input2 )
	end

	def values
		return [@input1.value, @input2.value]
	end

	private

	def checkInput( input )
		while !input.isValid?
			puts "Invaleid input. Try again."
			input = Input.new( gets.chomp )
		end
	end

	def createInput(input )
		input = Input.new( gets.chomp )
		checkInput( input )
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
# api.getPokemonById( data[0] )
# api.getPokemonById( data[1] )

# create pokemon from json
# compare stats

binding.pry







