require '../lib/game/missile'
require 'pry'


describe Missile do

	it 'has a MISSED constant' do
 	  expect(Missile::MISSED).to eq("O")
  end

  describe ".new" do
    context "when Missle class is initialized" do

      before do 
        @enemy_grid = [["_", "B", "_", "_", "_"], ["_", "_", "_", "_", "_"]]
        @missile_coordinates = ["0", "1"]
      	@missile = Missile.new(@enemy_grid, @missile_coordinates)
      end

      it "should create an instance of Missile" do  	
      	expect(@missile.instance_variable_get(:@enemy_grid)).to eq(@enemy_grid)
      	expect(@missile.instance_variable_get(:@target)).to eq(@missile_coordinates)
        expect(@missile.instance_variable_get(:@value)).to eq(1)
        expect(@missile).to respond_to (:target)
        expect(@missile).to respond_to (:enemy_grid)
        expect(@missile).to respond_to (:value)
      end
    end
  end

  describe ".valid_count?" do 
  	context "class method is called with different inputs" do 

  		before do 
    	  @validity1 = Missile.valid_count?(0)
        @validity2 = Missile.valid_count?(1)
    	  @validity3 = Missile.valid_count?(99)
        @validity4 = Missile.valid_count?(100)
      end

  		it "should return missile-count validity based on input missile count input" do 
			  expect(@validity1).to be false      	
	 		end

	 		it "should return missile-count validity based on input missile count input" do 
        expect(@validity2).to be true       
      end

      it "should return missile-count validity based on input missile count input" do 
        expect(@validity3).to be true       
      end

      it "should return missile-count validity based on input missile count input" do 
        expect(@validity4).to be false       
      end
  	end
  end 
end