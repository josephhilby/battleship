require 'rspec'
require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  it "Test 1: exists" do
    board = Board.new

    expect(board).to be_a(Board)
  end

  it "Test 2: can have coord" do
    board = Board.new
    board.cells

    expect(board.cells["A1"]).to be_a(Cell)
  end

  it "Test 3: can validate coord" do
    board = Board.new

    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
  end

  it "Test 4: can validate ship placement" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
  end
end