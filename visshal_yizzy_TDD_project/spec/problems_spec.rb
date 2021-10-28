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