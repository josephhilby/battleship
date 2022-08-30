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
  
  it "Test 6: knows if it's fired upon" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    
    expect(cell.fired_upon?).to eq(false)
  end
  
  it "Test 7: can be fired upon" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon
    
    expect(cell.ship.health).to eq(2)
    expect(cell.fired_upon?).to eq(true)
  end

  
end

