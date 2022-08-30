require 'rspec'
require 'pry'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  it "Test 1: exists" do
    cell = Cell.new("B4")

    expect(cell).to be_a(Cell)
  end
  
  it "Test 2: has readable attributes" do
    cell = Cell.new("B4")
    
    expect(cell.coordinate).to eq("B4")
  end
  
  it "Test 3: starts without ship" do
    cell = Cell.new("B4")
    
    expect(cell.ship).to eq(nil)
  end
  
  it "Test 4: starts empty" do
    cell = Cell.new("B4")
    
    expect(cell.empty?).to eq(true)
  end
  
  it "Test 5: can have hold ship" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    
    expect(cell.ship).to eq(cruiser)
    expect(cell.empty?).to eq(false)
  end
  
end

