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