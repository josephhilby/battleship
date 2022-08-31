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

  it "Test 8: cell will render" do
    cell_1 = Cell.new("B4")

    expect(cell_1.render).to eq(".")
  end

  it "Test 9: cell will render when fired upon" do
    cell_1 = Cell.new("B4")
    cell_1.fire_upon

    expect(cell_1.render).to eq("M")
  end

  it "Test 10: cell will render with debug S" do
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)

    expect(cell_2.render).to eq(".")
    expect(cell_2.render(true)).to eq("S")
  end

  it "Test 11: cell will render ship hit" do
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.fire_upon

    expect(cell_2.render).to eq("H")
    expect(cruiser.sunk?).to eq(false)
  end

  it "Test 12: cell will render ship sunk" do
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.fire_upon
    2.times {cruiser.hit}

    expect(cell_2.render).to eq("X")
    expect(cruiser.sunk?).to eq(true)
  end
end