require_relative "powerplants"
class Gmap
	def generate(districts, players_array)
		gmap = GameBoard.new(players_array)

		if districts.include?(:blue)
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
		end
		if districts.include?()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
		end
		if districts.include?()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
		end
		if districts.include?()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
		end
		if districts.include?()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
		end
		if districts.include?()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
			gmap.add_city()
		end
		Powersupply.new.generate(gmap)
		gmap
	end
end