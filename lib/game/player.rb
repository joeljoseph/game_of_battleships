class Player

	attr_reader :ship_coordinates, :missile_coordinates, :missiles, :player_grid, :enemy_grid

	def initialize(ship_coordinates, missile_coordinates,  missiles_count, player_grid, enemy_grid)
	  @ship_coordinates = ship_coordinates.map {|c| c.split(",") }
	  @missile_coordinates = missile_coordinates.map {|c| c.split(",") }
	  @missiles_count = missiles_count
	  @player_grid = player_grid
	  @enemy_grid = enemy_grid
	  #binding.pry	
	end

	def initiate_ships_to_grid
	  #binding.pry
	  ship_coordinates.each {|c| player_grid.grid[c[0].to_i][c[1].to_i] = Ship.new(c).status }  
	end

	def assign_missiles
	  #binding.pry
	  @missiles = (1..@missiles_count).map.with_index { |m, i|  Missile.new(enemy_grid, missile_coordinates[i]) }  
	end

	def fire_missiles_to_target_coordinates
		#binding.pry
	  missile_coordinates[0...missiles.count].each.with_index do |c,i| 
	  	enemy_grid.grid[c[0].to_i][c[1].to_i] = Ship::DEADSHIP if enemy_grid.grid[c[0].to_i][c[1].to_i] == Ship::LIVESHIP
	  	enemy_grid.grid[c[0].to_i][c[1].to_i] = Missile::MISSED if enemy_grid.grid[c[0].to_i][c[1].to_i] == BattleGrid::DEFAULT
	  	missiles[i].fire
	  end
	  #binding.pry
	end
	
end