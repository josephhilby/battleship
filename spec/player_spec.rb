require 'rspec'
require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'

RSpec.describe Player do
  it 'Test 1: exists' do
    player_1 = Player.new

    expect(player_1).to be_a Player
  end
  
  it 'Test 2: has a cruiser, submarine, and board' do
    player_1 = Player.new
    
    expect(player_1.cruiser.name).to eq("Cruiser")
    expect(player_1.submarine.name).to eq("Submarine")
    expect(player_1.board).to be_a Board
  end
  
  it 'Test 3: can be a human or computer' do
    player_1 = Player.new
    player_cpu = Player.new(true)
    
    expect(player_1.cpu).to eq(false)
    expect(player_cpu.cpu).to eq(true)
  end
  
  it 'Test 4: can make a turn as a cpu' do
    player_cpu = Player.new(true)
    move = player_cpu.cpu_move
    
    expect(move).to eq(player_cpu.board.cells.keys.find {|key| key == move})
  end
  
  it "Test 5: can lose a game" do
    player_1 = Player.new
    player_cpu = Player.new(true)
    
    expect(player_1.has_lost?).to eq(false)
    3.times {player_1.cruiser.hit}
    expect(player_1.has_lost?).to eq(false)
    2.times {player_1.submarine.hit}
    expect(player_1.has_lost?).to eq(true)
  end
end