require_relative "united_states_map"
require_relative "germany_map"

#contains everything involved with pre-game play
class Setup
	attr_accessor :players, :game_board
	
	#asks for number of players playing then adds them
	def initialize
		print C + "Welcome to Power Grid! This game is for 2 - 6 players.\nHow many players will be playing? "
		number_of_players = nil
		until number_of_players != nil
			number_of_players = case gets.chomp
			when "2" then 2
			when "3" then 3
			when "4" then 4
			when "5" then 5
			when "6" then 6
			else nil
			end
			puts "\nThat is not a valid choice, please try again: " if number_of_players == nil
		end
		@players = []
		add_players(number_of_players.to_i)
	end

	#allows user input of name and creates new player object
	def add_players(number_of_players)
		n = 1
		while number_of_players > 0
			print "\nPlayer #{n}, What is your name? "
			name = gets.chomp.downcase.split(" ").each {|word| word.capitalize!}.join(" ")
			@players << Player.new(name, n)
			n += 1
			number_of_players -= 1
		end
	end

	#allows user to input which map he would like to play
	def select_map
		print "\nThis game features two maps, United States (US) or Germany (G).\nWhich map would you like to play on? "
		input = nil
		until input != nil
			input = case gets.chomp.downcase
			when "us", "united states" then :US
			when "g", "germany" then :G
			else nil
			end
			puts "\nThat is not a vaild choice, please try again: " if input == nil
		end
		input
	end

	#allows more custom build of map based on what regions players want to play with by getting their input and checking if its an acceptable build then creates the game board object
	def build(map)
		number_of_players = @players.length
		regions = case number_of_players
		when 2, 3 then 3
		when 4 then 4
		when 5, 6 then 5
		end
		puts C + "Since you only have #{number_of_players} players, you can only\nuse #{regions} of the regions. The only requirement is that all the\nchosen regions need to be connected in some way, no islands."
		if map == :US
			puts "The colors are connected like this... Purple: Blue, Yellow, and Pink\nBlue: Purple and Pink -- Pink: Blue, Purple, Pink, Yellow, and Green\nYellow: Purple, Pink, Green, and Brown -- Brown: Yellow and Green\nGreen: Brown, Yellow, and Pink"
		elsif map == :G
			puts "The colors are connected like this... Green: Pink, Yellow, and Purple\nPurple: Yellow and Green -- Pink: Blue, Yellow, and Green\nYellow: Every color -- Blue: Brown, Yellow, and Pink\nBrown: Blue and Yellow"
		end
		if regions == 3 && map == :US
			acceptable_regions = [[:blue, :pink, :purple], [:blue, :pink, :yellow], [:blue, :pink, :green], [:blue, :purple, :yellow], [:purple, :yellow, :brown], [:purple, :yellow, :green], [:purple, :yellow, :pink], [:purple, :pink, :green], [:brown, :yellow, :green], [:brown, :yellow, :pink], [:brown, :green, :pink], [:green, :yellow, :pink]]
		elsif regions == 3 && map == :G
			acceptable_regions = [[:blue, :brown, :yellow], [:blue, :yellow, :pink], [:blue, :yellow, :green], [:blue, :yellow, :purple], [:blue, :pink, :green], [:brown, :blue, :pink], [:brown, :yellow, :pink], [:brown, :yellow, :green], [:brown, :yellow, :purple], [:purple, :yellow, :pink], [:purple, :yellow, :green], [:purple, :green, :pink], [:green, :yellow, :pink]]
		elsif regions == 4 && map == :US
			unacceptable_regions = [[:green, :yellow], [:pink, :yellow], [:purple, :pink]]
		elsif regions == 4 && map == :G
			unacceptable_regions = [[:blue, :yellow], [:green, :yellow], [:pink, :yellow]]
		end
		regions_requested = ["empty"]
		if regions == 3
			until acceptable_regions.any? {|combo| combo.all? {|x| regions_requested.include?(x)}}
				regions_requested = get_regions(regions)
				puts "\nThat was not an acceptable combination!" if not (acceptable_regions.any? {|combo| combo.all? {|x| regions_requested.include?(x)}})
			end
		elsif regions == 4
			until unacceptable_regions.all? {|combo| combo.any? {|x| regions_requested.include?(x)}}
				regions_requested = get_regions(regions)
				puts "\nThat was not an acceptable combination!" if not (unacceptable_regions.all? {|combo| combo.any? {|x| regions_requested.include?(x)}})
			end
		else
			until regions_requested.uniq.length == regions
				regions_requested = get_regions(regions)
				puts "\nNo duplicates allowed!" if not (regions_requested.uniq.length == regions)
			end
		end
		@game_board = case map
		when :US then USmap.new.generate(regions_requested, @players)
		when :G then Gmap.new.generate(regions_requested, @players)
		end
	end

	#prompts players for inputs for what regions of the map they want to play on
	def get_regions(count)
		regions_requested = []
		n = 1
		while count > 0
			print "\nWhat would you like region #{n} to be? "
			request = nil
			until request != nil	
				request = case gets.chomp.downcase
				when "bl", "blue" then regions_requested << :blue
				when "br", "brown" then regions_requested << :brown
				when "pu", "purple" then regions_requested << :purple
				when "pi", "pink" then regions_requested << :pink
				when "g", "green" then regions_requested << :green
				when "y", "yellow" then regions_requested << :yellow
				else nil
				end
				puts "\nThat's not a vaild choice, please try again: " if request == nil
			end
			n += 1
			count -= 1
		end
		regions_requested
	end

	#should return the completed game board ready to play on
	def start
		selection = select_map
		build(selection)
	end
end