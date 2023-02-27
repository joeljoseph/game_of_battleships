require '../lib/game/battle_grid'
require '../lib/game/ship'
require '../lib/game/missile'
require 'pry'


describe BattleGrid do

	it 'has a DEFAULT constant' do
 	  expect(BattleGrid::DEFAULT).to eq("_")
  end

  describe ".new" do
    context "when BattleGrid class is instantiated" do

      before do 
      	@battle_grid = BattleGrid.new(3)
      end

      it "should create an instance of BattleGrid" do 
        expect(@battle_grid).to respond_to(:size)
        expect(@battle_grid).to respond_to(:grid)   
        expect(@battle_grid).to respond_to(:hits)   
        expect(@battle_grid).to respond_to(:misses)     	
      	expect(@battle_grid.instance_variable_get(:@size)).to eq(3)
        expect(@battle_grid.instance_variable_get(:@hits)).to eq(0)
        expect(@battle_grid.instance_variable_get(:@misses)).to eq(0)
      	expect(@battle_grid.grid).to all(be_a(Array))
        @battle_grid.grid.each  do |ary|
          expect(ary). to all(be BattleGrid::DEFAULT)
        end
      end
    end
  end

  describe ".valid_size?" do 
  	context "class method is called with different inputs to if grid of valid size" do 

  		before do 
    	  @validity1 = BattleGrid.valid_size?(0)
        @validity2 = BattleGrid.valid_size?(1)
        @validity3 = BattleGrid.valid_size?(9)
        @validity4 = BattleGrid.valid_size?(10)
      end

  		it "should return grid-size validity" do 
			  expect(@validity1).to be false
        expect(@validity2).to be true  
        expect(@validity3).to be true  
        expect(@validity4).to be false        	
	 		end
  	end
  end 


  describe "#generate_grid_report" do 
    context "generate grid report based on current grid status of a player" do 

      before do 
        @battle_grid = BattleGrid.new(3)
      end

      it "should print in the following format in STDOUT" do 
        expect(@battle_grid.hits).to eq(0)
        expect(@battle_grid.misses).to eq(0)
        expect { @battle_grid.generate_grid_report }.to output("\n___\n___\n___\n\n").to_stdout       
      end
    end
  end 
end