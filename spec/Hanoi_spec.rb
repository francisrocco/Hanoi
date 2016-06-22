require 'rspec'
require 'spec_helper'
require 'Hanoi.rb'

describe Hanoi do
  subject(:game) { Hanoi.new(4) }

  describe "#initialize" do

    it 'sets up an array of 3 arrays' do
      expect(game.board.length).to eq(3)
    end

    it 'returns 2 empty arrays and 1 array from 1 to disk_count' do
      expect(game.board).to eq( [[1, 2, 3, 4], [], []] )
    end

    it "raises Error if 0 is passed to Hanoi.new" do
      expect { Hanoi.new(0) }.to raise_error(DiskCountError)
    end

    it "raises Error if non-Fixnum is passed to Hanoi.new" do
      expect { Hanoi.new("b") }.to raise_error(DiskCountError)
    end

  end

  describe "#get_move" do

    it 'raises error if 1 number is passed' do
      let(:user_input) { "0" }
      expect { get_move(user_input) }.to raise_error(MoveInputError)
    end

    it 'raises error if no numbers are passed' do
      let(:user_input) { " " }
      expect { get_move(user_input) }.to raise_error(MoveInputError)
    end

    it 'raises error if syntax is wrong (num, num)' do
      let(:user_input) { "2 1" }
      expect { get_move(user_input) }.to raise_error(MoveInputError)
    end

    it 'raises error if inputs are not numbers between 0 and 2' do
      let(:user_input) { "4, 3 " }
      expect { get_move(user_input) }.to raise_error(MoveInputError)
    end

    it 'returns an array' do
      let(:user_input) { "0, 2" }
      expect(get_move(user_input)).to eq([0, 2])
    end 


  end

  describe "#valid_move?"




  describe "#move"







  describe "#win?"








end
