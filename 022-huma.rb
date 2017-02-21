require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

puts "Hello, what do you want to know about?"
desiredKnowledge = gets.chomp
desiredKnowledge = desiredKnowledge.gsub(" ","_")

binding.pry 

doc = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/' + desiredKnowledge))
docName = doc.xpath('//h1')[0].text
docOverview = doc.xpath('//p')[0].text

puts "#{docName}\n\n#{docOverview}"