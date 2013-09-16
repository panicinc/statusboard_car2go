#!/usr/bin/env ruby

require 'rubygems' 
require 'bundler/setup' 
require 'erb'
require 'car2go'
require 'cgi'
include Car2Go


html_templateFile = 'index.html.erb'

cgi = CGI.new

carData = cgi['carData']

if carData == ""
	puts cgi.header

	html_renderer = ERB.new(IO.read(html_templateFile))
	puts html_renderer.result()
else
	cars = close_cars(600)
	puts cgi.header('type' => 'application/json')
	puts cars.to_json
end
