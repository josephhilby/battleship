require 'rspec'
require 'pry'
require './lib/ship'

RSpec.describe Ship do
  it "Test 1: exists" do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser).to be_a Ship
  end

  it 'Test 2: has readable attributes' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.name).to eq("Cruiser")
    expect(cruiser.length).to eq(3)
    expect(cruiser.health).to eq(3)
    expect(cruiser.sunk?).to eq(false)
  end

  it 'Test 3: can be hit' do
    cruiser = Ship.new("Cruiser", 3)

    cruiser.hit
    expect(cruiser.health).to eq(2)
  end

  it 'Test 4: can be sunk' do
    cruiser = Ship.new("Cruiser", 3)

    cruiser.hit
    expect(cruiser.health).to eq(2)
    cruiser.hit
    expect(cruiser.health).to eq(1)
    expect(cruiser.sunk?).to eq(false)
    cruiser.hit
    expect(cruiser.health).to eq(0)
    expect(cruiser.sunk?).to eq(true)
  end
end