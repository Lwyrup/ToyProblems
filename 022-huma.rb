require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

puts "Hello, what do you want to know about?"
desiredKnowledge = gets.chomp
desiredKnowledge = desiredKnowledge.gsub(" ","_")

doc = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/' + desiredKnowledge))
docName = doc.xpath('//h1')[0].text
docOverview = doc.xpath('//p')[0].text

docOverview.slice! /\[\d+\]/
binding.pry
puts "\n#{docName}\n\n#{docOverview}"