require_relative 'battle_grid'
require_relative 'player'
require_relative 'missile'
require_relative 'ship'

class Battle 
	
	def initialize(file_path)
		@file_path = file_path
		read_input_file
		check_input_validity                  
	end

	def valid_input?
		(@valid_battle_grid && @valid_battle_ships_count && @valid_missiles_count) ? true : false 
	end

	def commence
		#initiate 
		intialize_battle_grid
		initialize_player_resources
		@p1.initiate_ships_to_grid
		@p2.initiate_ships_to_grid
		@p1.assign_missiles
		@p2.assign_missiles
		@p1.fire_missiles_to_target_coordinates
		@p2.fire_missiles_to_target_coordinates
	end

	def generate_mission_report
		puts "Player 1"
		@g1.generate_grid_report

		puts "Player 2"
		@g2.generate_grid_report
	end

	def declare_winner
		puts "P1: #{@g2.hits}"
		puts "P2: #{@g1.hits}"

		if @g1.hits > @g2.hits
		  puts "Player 2 wins"
		elsif @g1.hits < @g2.hits
		  puts "Player 1 wins"
		else
	    puts "It is a draw"
		end
	end

	private

	def read_input_file
    contents = File.open(@file_path, 'r') {|f| f.read.split("\n") }
    @grid_size = contents[0].to_i
    @ships_count = 	contents[1].to_i
    @player1_ships_coordinates = contents[2].split(":")
    @player2_ships_coordinates = contents[3].split(":")
    @missiles_count = contents[4].to_i
    @player1_missile_coordinates = contents[5].split(":")
    @player2_missile_coordinates = contents[6].split(":")
	end

	def check_input_validity
		@valid_battle_grid = BattleGrid.valid_size?(@grid_size)
		@valid_battle_ships_count = Ship.valid_count?(@grid_size, @ships_count)
		@valid_missiles_count = Missile.valid_count?(@missiles_count)
	end

	def intialize_battle_grid
		@g1 = BattleGrid.new(@grid_size)
		@g2 = BattleGrid.new(@grid_size)
	end

	def initialize_player_resources
		@p1 = Player.new(@player1_ships_coordinates, @player1_missile_coordinates, @missiles_count, @g1, @g2)
		@p2 = Player.new(@player2_ships_coordinates, @player2_missile_coordinates, @missiles_count, @g2, @g1)
	end

end