require 'rubygems'
require 'nokogiri'
require 'open-uri'
PAGE_URL = "http://ruby.bastardsbook.com/files/hello-webpage.html"

doc = Nokogiri::HTML(URI.open('http://www.google.com/search?q=doughnuts'))
	doc.css('h3.r > a.l').each do |node|
	  puts node.text
	end