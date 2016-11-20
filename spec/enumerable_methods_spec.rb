require_relative '../enumerable_methods/enumerable_methods'

describe 'Enumerable Methods' do
  describe "my_each" do
    
    before do
      @a = ["a", "b", "c"]
    end
    
    # it "should return an Enumerator if no block is given" do
    #   expect(@a.my_each).to eq(@a.each)
    # end
    
    it "should call the given block once for each element in self" do
      expect(@a.my_each {|x| print x, " -- " }).to eq("a -- b -- c -- ")
    end
  end
end