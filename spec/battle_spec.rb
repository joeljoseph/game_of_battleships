require '../lib/game/battle'
require '../lib/game/battle_grid'
require '../lib/game/player'
require '../lib/game/ship'
require '../lib/game/missile'
require 'pry'


describe Battle do

  before(:each) do 
    @battle = Battle.new("input_sample.txt")
    @battle.send(:read_input_file)
    @battle.send(:check_input_validity)
    @battle.send(:intialize_battle_grid)
    @battle.send(:initialize_player_resources)    
  end

  describe ".new" do
    context "when Battle class is initialized" do

      it "should initialise instance variable file_path with input file path" do
        expect(@battle.instance_variable_get(:@file_path)).not_to be_nil
        expect(@battle.instance_variable_get(:@file_path)).to be_instance_of(String)   	
      end
    end
  end


  describe "#read_input_file" do 
    context "of user inputted file path" do 

      it "should parse the input file and populate following data points" do
         expect(@battle.instance_variable_get(:@grid_size)).to eq(3)
         expect(@battle.instance_variable_get(:@missiles_count)).to eq(5)
         expect(@battle.instance_variable_get(:@player1_ships_coordinates)).to be_instance_of(Array)  
         expect(@battle.instance_variable_get(:@player1_ships_coordinates)).to eq(["1,1", "2,0", "2,2"])
         expect(@battle.instance_variable_get(:@player1_missile_coordinates)).to be_instance_of(Array) 
         expect(@battle.instance_variable_get(:@player1_missile_coordinates)).to eq(["0,1", "1,2", "2,2"])
         expect(@battle.instance_variable_get(:@player2_ships_coordinates)).to be_instance_of(Array)  
         expect(@battle.instance_variable_get(:@player2_ships_coordinates)).to eq(["0,1", "2,2", "2,0"])
         expect(@battle.instance_variable_get(:@player2_missile_coordinates)).to be_instance_of(Array)
         expect(@battle.instance_variable_get(:@player2_missile_coordinates)).to eq(["0,1", "0,0", "1,1"])
      end
    end
  end

  describe "#check_input_validity" do 
    context "of user inputted file path" do 

      it "should populate flags for data validity" do 
        expect(@battle.instance_variable_get(:@valid_battle_grid)).to be true
        expect(@battle.instance_variable_get(:@valid_battle_ships_count)).to be true
        expect(@battle.instance_variable_get(:@valid_missiles_count)).to be true      
      end
    end
  end

  describe "#valid_input?" do 
    context "ensure input validity based on given rule" do 

      it "should return for data validity as true for the correct input from input_sample.txt" do 
        expect(@battle.valid_input?).to be true   
      end
    end
  end

  describe "#intialize_battle_grid" do 
    context "ensure two battle grids are instantiated" do 
      # before do 
      #   @battle.send(:intialize_battle_grid)    
      # end
      it "should populate two battle grid instances of size" do 
        expect(@battle.instance_variable_get(:@g1)).to be_instance_of(BattleGrid)
        expect(@battle.instance_variable_get(:@g2)).to be_instance_of(BattleGrid)
        expect(@battle.instance_variable_get(:@g1).size).to eq(3)
        expect(@battle.instance_variable_get(:@g2).size).to eq(3)
      end
    end
  end

  describe "#initialize_player_resources" do 
    context "ensure two players are instantiated" do 
      # before do 
      #   @battle.send(:intialize_battle_grid)
      #   @battle.send(:initialize_player_resources)    
      # end
      it "should populate two player instances" do 
        expect(@battle.instance_variable_get(:@p1)).to be_instance_of(Player)
        expect(@battle.instance_variable_get(:@p2)).to be_instance_of(Player)
      end
    end
  end

end