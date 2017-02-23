require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

puts "Enter a game name to check for titles."
input = gets.chomp

doc = Nokogiri::HTML(open("http://www.spielbound.org/library?title=#{input}"))

names = doc.css("div[class = 'gamecard'] h2")

puts "\nFollowing titles found\n----------------------"
for title in names do
	puts title.text
end
