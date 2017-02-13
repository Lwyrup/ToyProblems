require 'net/http'
require 'json'
require 'pry'

def getPokemon(number)
	uri = URI('http://pokeapi.co/api/v2/pokemon/' + number.to_s + '/')
	massData = Net::HTTP.get(uri)
	return jsonData = JSON.parse(massData)
end

def speedOfPokemon(jsonObject)
	return {"name" => jsonObject["name"], "speed" => jsonObject["stats"][0]["base_stat"]}
end

def comparePokemonSpeed(pokemon1, pokemon2)
	if pokemon1["speed"] < pokemon2["speed"]
		return pokemon2["name"] + " is faster."
	elsif pokemon1["speed"] > pokemon2["speed"]
		return pokemon1["name"] + " is faster."
	else
		return pokemon1["name"] + " and " + pokemon2["name"] + " are the same speed."
	end
end

def pokeDecider(pokeNum1, pokeNum2)
	poke1 = speedOfPokemon(getPokemon(pokeNum1))
	poke2 = speedOfPokemon(getPokemon(pokeNum2))
	return comparePokemonSpeed(poke1,poke2)
end

def askUser()
	puts "Enter a number of a pokemon..."
	pokemonNum1 = gets.chomp
	puts "Enter another number of a pokemon..."
	pokemonNum2 = gets.chomp
	puts pokeDecider(pokemonNum1, pokemonNum2)
end

askUser()