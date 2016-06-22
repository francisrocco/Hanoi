require 'rspec'
require 'spec_helper'
require 'Array'

describe Array do

  describe '#my_uniq' do
    it "returns unique elements" do
      expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
    end

    it "returns elements in their order of appearance" do
      expect([3, 3, 1, 2, 2, 4].my_uniq).to eq([3, 1, 2, 4])
    end

    it "returns empty array when given empty array" do
      expect([].my_uniq).to eq([])
    end

  end

  describe '#two_sum' do
    it 'returns indeces of pairs of numbers pairs that sum to zero' do
      expect([-1, 0 ,2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end

    it 'returns empty array if cannot find a pair that sums to zero' do
      expect([1, 2, 3, 4, 5].two_sum).to eq([])
    end

  end

  describe '#my_transpose' do
    it 'returns a transposed version of the original matrix' do
      expect([[0, 1, 2], [3, 4, 5], [6, 7, 8]].my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end

    it 'returns an empty array if called on empty array' do
      expect([].my_transpose).to eq([])
    end

    it 'handles rectangle arrays' do
      expect([[0, 1, 2], [3, 4, 5]].my_transpose).to eq([[0, 3], [1, 4], [2, 5]])
    end
  end

end

describe '#stock_picker' do
  it 'returns array of two indeces' do
    expect(stock_picker([1, 2, 3, 4]).length).to eq(2)
  end

  it 'returns array in order of buy, sell' do
    expect(stock_picker([1, 2, 3, 4])).to eq([0, 3])
  end

  it "doesn't just return min and max" do
    expect(stock_picker([10, 0, 1, 2, 3, 4])).to eq([1, 5])
  end

  it 'returns empty array if given one price' do
    expect(stock_picker([3])).to eq([])
  end

  it 'returns empty array if no price is given' do
    expect(stock_picker([])).to eq([])
  end

end
