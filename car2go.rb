require 'rubygems' 
require 'bundler/setup' 
require 'rgeo'
require 'rest_client'
require 'json'

module Car2Go

	def factory
		RGeo::Geographic.projected_factory(:projection_proj4 => '+proj=merc +lon_0=0 +k=1 +x_0=0 +y_0=0 +ellps=WGS84 +datum=WGS84 +units=m +no_defs')
	end

	def my_location
		factory.point(SiteConfig['longitude'], SiteConfig['latitude'])
	end

	def all_cars(limit = nil)
	
		json_data = RestClient.get 'http://www.car2go.com/api/v2.1/vehicles', {:params => {:oauth_consumer_key => SiteConfig['car2go_key'], :loc => 'portland', :format => 'json'}}
		
		placemarks = JSON.parse(json_data)
		cars = placemarks["placemarks"]
		
		cars.each do |c|
			coords = c["coordinates"]
			car_location = factory.point(coords[0],coords[1])
			c["distance"] = my_location.distance(car_location)
			
		end
		
		limit = cars.count if !limit
		
		cars = cars.sort_by {|c| c["distance"] }
		cars[0..limit-1]
	end

	def close_cars(distance = 600)
		all_cars.reject! {|c| c["distance"] > distance }
	end
	
end