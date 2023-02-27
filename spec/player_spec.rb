require '../lib/game/player'
require '../lib/game/battle_grid'
require '../lib/game/ship'
require 'pry'


describe Player do

  before(:each) do
    @ship_coordinates = ["1,1", "2,0", "2,2"]
    @missile_coordinates = ["0,1", "1,2", "2,2"]
    @missiles_count = 3
    @player_grid = BattleGrid.new(3)
    @enemy_grid = BattleGrid.new(3)
    @player = Player.new(@ship_coordinates, @missile_coordinates, @missiles_count, @player_grid, @enemy_grid)
  end

  describe ".new" do
    context "when a Player object is instantiated" do

      it "should create an instance of Ship" do 
        expect(@player).to respond_to(:ship_coordinates)
        expect(@player).to respond_to(:missile_coordinates)
        expect(@player).to respond_to(:missiles)
        expect(@player).to respond_to(:player_grid)
        expect(@player).to respond_to(:enemy_grid)   	
      	expect(@player.ship_coordinates).to eq(@ship_coordinates.map {|c| c.split(",")})
        expect(@player.missile_coordinates).to eq(@missile_coordinates.map {|c| c.split(",")})
        expect(@player.instance_variable_get(:@misssiles)).to be_nil
        expect(@player.instance_variable_get(:@missiles_count)).to eq(@missiles_count)
        expect(@player.instance_variable_get(:@missiles_count)).to be_instance_of(Integer)
        expect(@player.player_grid).to be_instance_of(BattleGrid)
        expect(@player.enemy_grid).to be_instance_of(BattleGrid)   
      end
    end
  end

  describe "#initiate_ships_to_grid" do 
    context "when ships are moved to the respective coordinates" do 
      before do 
        @player.initiate_ships_to_grid
      end

      it "should have ships at the correct coordinates" do 
        @player.ship_coordinates.each.with_index do |c, i|
          expect(@player_grid.grid[c[0].to_i][c[1].to_i]). to eq(Ship::LIVESHIP)
        end
      end

      it "should only have the correct no of ships on the grid" do 
        expect(@player.player_grid.grid.flatten.count(Ship::LIVESHIP)).to eq 3
      end
    end
  end
 
  describe "#assign_missiles" do 
    context "when missiles are assigned" do 
      before do 
        @player.assign_missiles
      end

      it "should have correct no of missiles assigned" do 
        expect(@player.missiles).to be_instance_of(Array)
        expect(@player.missiles.count).to eq 3
      end
    end
  end

  describe "#fire_missiles_to_target_coordinates" do 
    context "when missiles are fired to target coordinates on enemy_grid" do 
      before do
        @player2_ship_coordinates = ["0,1", "2,2", "2,0"]
        @player2_missile_coordinates = ["0,1", "0,0", "1,1"]
        @player2_grid = @enemy_grid
        @player2 = Player.new(@player2_ship_coordinates, @player2_missile_coordinates, @missiles_count, @player2_grid, @player_grid)
        @player2.initiate_ships_to_grid
        @player.assign_missiles
        @player.fire_missiles_to_target_coordinates
      end

      it "should mark 'X' representing HIT if ship is present at the missile target coordinates" do        
        expect(@player2.player_grid.grid[0][1]).to eq(Ship::DEADSHIP)
        expect(@player2.player_grid.grid[2][2]).to eq(Ship::DEADSHIP)     
      end

      it "should mark 'O' representing MISS if ship is not present at the missile target coordinates" do 
        expect(@player2.player_grid.grid[1][2]).to eq(Missile::MISSED)           
      end

      it "should have total of HITS and MISSES to be equal to missile count" do 
        hit_count = @player2.player_grid.grid.flatten.count(Ship::DEADSHIP)
        miss_count = @player2.player_grid.grid.flatten.count(Missile::MISSED)
        expect(hit_count+miss_count).to eq(@missiles_count)
      end
    end
  end
end