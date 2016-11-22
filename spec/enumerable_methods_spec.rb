require_relative '../enumerable_methods/enumerable_methods'

describe 'Enumerable Methods' do

  before do
    @a = [1,2,3,4,5,2]
    @b = %w[ant bear cat]
    @c = [nil, true, 99]
  end

  describe "#my_each" do
        
    it "should return an Enumerator if no block is given." do
      expect(@a.my_each).to be_kind_of(Enumerator)
    end
    
    it "should call the given block once for each element in self." do
      expect{|b| @a.my_each(&b)}.to yield_successive_args(1,2,3,4,5,2)
    end
  end

  describe "#my_each_with_index" do

    it "should return an Enumerator if no block is given." do
      expect(@a.my_each_with_index).to be_kind_of(Enumerator)
    end

    it "should call the given block with two elements, the " +
       "item and its index, once for each element in self." do
      expect{|b| @a.my_each_with_index(&b)}.to yield_successive_args([1,0],[2,1],[3,2],[4,3],[5,4],[2,5])
    end
  end

  describe "#my_select" do

    it "should return an Enumerator if no block is given." do
      expect(@a.my_select).to be_kind_of(Enumerator)
    end

    it "should return an array containing all elements " +
       "for which the given block returns a true value." do
      expect(@a.my_select{|x| x.even?}).to eq([2,4,2])
    end
  end

  describe "#my_all?" do

    it "should return true if the block never returns false or nil." do
      expect(@b.my_all?{|word| word.length >=3}).to be(true)
    end

    it "should return false if the block returns false or nil" do
      expect(@b.my_all?{|word| word.length >=4}).to be(false)
    end

    it "should return false if no block is given and some members " +
       "are false or nil." do
      expect(@c.my_all?).to be(false)
    end
  end

  describe "#my_any?" do

    it "should return true if the block never returns false or nil." do
      expect(@b.my_any?{|word| word.length >=3}).to be(true)
    end

    it "should return true if the block ever returns other than false or nil" do
      expect(@b.my_any?{|word| word.length >=4}).to be(true)
    end

    it "should return true if no block is given and any members " +
       "are not false or nil." do
      expect(@c.my_any?).to be(true)
    end
  end

  describe "#my_none?" do

    it "should return true if the block never returns true." do
      expect(@b.my_none?{|word| word.length == 5}).to be(true)
    end

    it "should return false if the block ever returns true." do
      expect(@b.my_none?{|word| word.length >= 4}).to be(false)
    end

    it "should return true only if no members are true if no block " +
       "is given." do
      expect([].my_none?).to be(true)
      expect([nil, false].my_none?).to be(true)
      expect([nil, false, true].my_none?).to be(false)
    end
  end

  describe "#my_count" do

    it "should return the number of items" do
      expect(@a.my_count).to eq(6)
    end

    it "should return the number of items equal to an argument" do
      expect(@a.my_count(2)).to eq(2)
    end

    it "should return the number of true results of a block" do
      expect(@a.my_count{|x| x % 2 == 0}).to eq(3)
    end
  end

  describe "#my_map" do

    it "should return an Enumerator if no block is given." do
      expect(@a.my_map).to be_kind_of(Enumerator)
    end

    it "should create a new array with the return values from a block" do
      expect(@a.my_map{|x| x + 2}).to eq([3,4,5,6,7,4])
    end
  end

  describe "#my_inject" do

    describe "no block" do
      it "should combine all elements by applying a binary operation, " +
         "specified by a symbol that names an operator" do
        expect(@a.my_inject(:*)).to eq(240)
      end
      it "should use that as the first number if a number is supplied" do
        expect(@a.my_inject(2,:*)).to eq(480)
      end
    end

    describe "block" do
      it "should combine all elements by applying a binary operation, " +
         "specified by a block" do
        expect(@a.my_inject{|product, n| product * n}).to eq(240)
      end
      it "should use that as the first number if a number is supplied" do
        expect(@a.my_inject(2){|product, n| product * n}).to eq(480)
      end
    end
  end

end