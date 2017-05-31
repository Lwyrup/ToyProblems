require 'net/http'
require 'json'
require 'pry'

# def getPokemonData(number)
# 	uri = URI('http://pokeapi.co/api/v2/pokemon/' + number.to_s + '/')
# 	massData = Net::HTTP.get(uri)
# 	return jsonData = JSON.parse(massData)
# end

# def getSpeedAndName(jsonObject)
# 	return {"name" => jsonObject["name"], "speed" => jsonObject["stats"][0]["base_stat"]}
# end

# def comparePokemonSpeed(pokemon1, pokemon2)
# 	if pokemon1["speed"] < pokemon2["speed"]
# 		return pokemon2["name"] + " is faster."
# 	elsif pokemon1["speed"] > pokemon2["speed"]
# 		return pokemon1["name"] + " is faster."
# 	else
# 		return pokemon1["name"] + " and " + pokemon2["name"] + " are the same speed."
# 	end
# end

# def pokeDecider(pokeNum1, pokeNum2)
# 	poke1 = getSpeedAndName(getPokemonData(pokeNum1))
# 	poke2 = getSpeedAndName(getPokemonData(pokeNum2))
# 	return comparePokemonSpeed(poke1,poke2)
# end

# def askUser()
# 	puts "Enter a number of a pokemon..."
# 	pokemonNum1 = gets.chomp
# 	puts "Enter another number of a pokemon..."
# 	pokemonNum2 = gets.chomp
# 	puts pokeDecider(pokemonNum1, pokemonNum2)
# end

# askUser()


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

class User
	@input1
	@input2

	def ask
		puts "Enter the number of a pokemon."
		createInput( @input1 )
		puts "Enter another number of a pokemon."
		createInput( @input2 )
	end

	private
	
	def checkInput( input )
		while !input.isValid?
			puts "Invalid input. Try again."
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

	def isValid?
		return @isValid
	end

	private
	def matchesPattern(string)
	    return string =~ /(^[a-zA-Z]+$|^\d+$)/
	end
end

# api = PokeAPI.new()
# # Get user input
# api.getPokemonById( userInput )

# create pokemon from json
# compare stats

binding.pry







