require_relative 'ship'
require_relative 'missile'
class BattleGrid

  DEFAULT = "_"
  
	attr_reader :size, :grid, :hits, :misses

	def initialize(size)
    @size = size
    @hits = 0
    @misses = 0
    @grid = Array.new(@size) do
	    Array.new(@size) do
	      DEFAULT
	    end
    end
	end

	def generate_grid_report
		#binding.pry
	  (0...@grid.size).each do |i|
	  	  print "\n"
	  	(0...@grid[i].size).each do |j|
	  	  print @grid[i][j]
	  	  @hits += 1 if @grid[i][j] == Ship::DEADSHIP
	  	  @misses += 1 if @grid[i][j] == Missile::MISSED
	  	end
	  end
	  puts "\n\n"
	end

	def self.valid_size?(grid_size)
    ( grid_size > 0 && grid_size < 10 ) ? true : false
	end

end