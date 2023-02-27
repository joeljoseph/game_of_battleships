class Ship

  LIVESHIP = "B"
  DEADSHIP = "X"

	attr_reader :status

	def initialize(location=[])
		@location = location
		@status = LIVESHIP
	end

  def self.valid_count?(grid_size, ships_count)
  	((ships_count > 0) && (ships_count < (grid_size**2)/2)) ? true : false
  end

end