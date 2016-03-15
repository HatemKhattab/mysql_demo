require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://www.aftonbladet.se/"))
puts "Page class"
puts page.class
