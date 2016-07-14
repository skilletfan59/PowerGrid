C = %x{clear}
class GameBoard
	attr_accessor :cities_one, :powerplants, :step_three_powerplants, :cities_two, :cities_three

	def initialize(players_array)
		@cities_one = []
		@powerplants = []
		@step_three_powerplants = []
		@players = players_array
	end

	def add_city(reference, district, connections)
		@cities_one << City.new(reference, district, connections)
	end

	def add_powerplant(reference, city_power, resources_required)
		@powerplants << Powerplant.new(reference, city_power, resources_required)
	end

	def step_two_cites
		@cities_two = @cities_one
		@cities_two.each do |city|
			cmap = city.connections
			cmap.each {|key, cost| cmap[key] = cost + 5}
		end
	end

	def step_three_cities
		@cities_three = @cities_one
		@cities_three.each do |city|
			cmap = city.connections
			cmap.each {|key, cost| cmap[key] = cost + 10}
		end
	end
end

class Player
	attr_accessor :reference, :name, :cities, :money, :powerplants

	def initialize(name, reference)
		@reference = reference
		@name = name
		@cities = []
		@powerplants = []
		@money = 50
	end
end

class City
	attr_accessor :reference, :district, :connections

	def initialize(reference, district, connections)
		@reference = reference
		@district = district
		@connections = connections
	end
end

class Powerplant
	attr_accessor :reference, :city_power, :resources_required, :resource_stockpile

	def initialize(reference, city_power, resources_required)
		@reference = reference
		@city_power = city_power
		@resources_required = resources_required
		@resource_stockpile = []
	end
end