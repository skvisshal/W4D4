require "problems.rb"
require "rspec"

describe "#my_uniq" do
    subject(:arr) {arr = [1,2,3,3]}
    it "returns a new array" do     
        expect(my_uniq(arr)).not_to be(arr)
    end

    it "removes all non-unique elements" do
        expect(my_uniq(arr)).to eq([1,2,3])
    end
end

describe "#two_sum" do
    subject(:arr) {arr = [-1,0,2,-2,1]}
    
    it "returns a new array" do     
        expect(arr.two_sum.is_a?(Array)).to eq(true)
    end

    it "finds the indices of all pairs that sum to zero" do
        expect(arr.two_sum).to eq([[0,4],[2,3]])
    end

end

describe "#my_transpose" do
  subject(:rows){rows = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]}


  it "returns a new array" do
    expect(my_transpose(rows).length).to eq(rows.length) 
  end

  it "returns an array with the same number" do

    expect(my_transpose(rows)).to eq(rows.transpose)
  end
end

describe "#stock_picker" do

    subject(:arr) {arr = [3, 1, 5, 2, 3, 7]}

    it "returns a new array" do     
        expect(stock_picker(arr).is_a?(Array)).to eq(true)
    end

    it "returns the most profitable pair" do 
        expect(stock_picker(arr)).to eq([1,5])
    end

end

describe Towers do

    subject(:towers) {Towers.new}

    describe "#initialize" do
        it "should initialize towers to an array" do 
            expect(towers.tower_1).to eq([4,3,2,1])
            expect(towers.tower_2).to eq([])
            expect(towers.tower_3).to eq([])
        end
    end

    describe "#move" do

        it "should recieve 2 arrays" do
            expect{towers.move(towers.tower_1,towers.tower_2)}.not_to raise_error
        end

        it  "should move correctly" do 
            towers.move(towers.tower_1,towers.tower_2)
            expect(towers.tower_1).to eq([4,3,2])
            expect(towers.tower_2).to eq([1])
        end
    end

    describe "#won?" do
        it  "should have all disks in order in 3rd array" do 
            towers.tower_1 = []
            towers.tower_2 = []
            towers.tower_3 = [4,3,2,1]
            towers.won?
            expect(towers.tower_1).to eq([])
            expect(towers.tower_2).to eq([])
            expect(towers.tower_3).to eq([4,3,2,1])
        end
    end
end