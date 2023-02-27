class Missile

	MISSED = "O"

	attr_reader :target, :enemy_grid, :value

	def initialize(enemy_grid, target_coordinates)
		@enemy_grid = enemy_grid
		@target = target_coordinates
		@value = 1
	end

	def fire
		#boom
		@value = 0
	end

	def boom
		#puts "Booom!!! @ #{target}"
	end

	def self.valid_count?(count)
	  (count > 0 && count < 100) ? true : false
	end
	
end