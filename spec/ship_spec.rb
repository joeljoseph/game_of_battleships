require '../lib/game/ship'
require 'pry'


describe Ship do

	it 'has a LIVESHIP constant' do
 	  expect(Ship::LIVESHIP).to eq("B")
  end

  it 'has a DEADSHIP constant' do
 	  expect(Ship::DEADSHIP).to eq("X")
  end

  describe ".new" do
    context "when Ship class is initialized" do

      before do 
      	@ship = Ship.new(["1", "1"])
      end

      it "should create an instance of Ship" do  	
      	expect(@ship.instance_variable_get(:@location)).to eq(["1", "1"])
      	expect(@ship.instance_variable_get(:@status)).to eq(Ship::LIVESHIP)
        expect(@ship).to respond_to(:status) 
      end
    end
  end

  describe ".valid_count?" do 
  	context "class method is called with different inputs" do 

  		before do 
    	  @validity1 = Ship.valid_count?(5, 11)
    	  @validity2 = Ship.valid_count?(5, 12)
      end

  		it "should return ship-count validity based on grid size" do 
			  expect(@validity1).to be true
        expect(@validity2).to be false        	
	 		end
  	end
  end 
end