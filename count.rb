#!/usr/bin/env ruby

require 'rubygems' 
require 'bundler/setup' 
require 'erb'
require 'car2go'
include Car2Go

cars = close_cars

html_templateFile = 'count.html.erb'


puts "Content-type: text/html"
puts

html_renderer = ERB.new(IO.read(html_templateFile))
puts html_renderer.result()

