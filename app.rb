Encoding.default_internal = 'UTF-8'
require 'rubygems'
require 'bundler/setup'
Bundler.require

require 'erb'
require './car2go'

if !File.exists?('config.yml')
	puts "Copy config.yml.template to config.yml and fill in your settings"
	exit
end

SiteConfig = YAML.load_file('config.yml')

include Car2Go

get '/' do
	erb :'index.html'
end

get '/data.json' do
	cars = close_cars(600)
	cars.to_json
end

get '/count' do
	@cars = close_cars(600)
	erb :'count.html'
end
