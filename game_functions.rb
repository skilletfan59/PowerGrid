module GameFunctions
	def find_city(cities_array, reference)
		cities_array.detect {|city| city.reference == reference}
	end

	def find_powerplant(powerplants_array, reference)
		powerplants_array.detect {|pp| pp.reference == reference}
	end
end