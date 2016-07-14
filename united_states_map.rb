require_relative "powerplants"
class USmap
	def generate(districts, players_array)
		usmap = GameBoard.new(players_array)

		if districts.include?(:blue)
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
		end
		if districts.include?()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
		end
		if districts.include?()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
		end
		if districts.include?()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
		end
		if districts.include?()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
		end
		if districts.include?()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
			usmap.add_city()
		end
		Powersupply.new.generate(usmap)
		usmap
	end
end