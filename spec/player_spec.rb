require 'rspec'
require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/player'

RSpec.describe Player do
  it 'Test 1: exists' do
    board_1 = Board.new
    player_1 = Player.new("Aurora", board_1)
    
    expect(player_1).to be_a(Player)
  end
  
  it 'Test 2: player has ships' do
    board_1 = Board.new
    cruiser_1 = Ship.new("Cruiser", 3)
    submarine_1 = Ship.new("Submarine", 2)
    player_1 = Player.new("Aurora", board_1)
    player_1.assign_ships(cruiser_1, submarine_1)
    
    expect(player_1.player_ships).to eq([cruiser_1, submarine_1])
  end
  
end

# board = Board.new
# cruiser = Ship.new("Cruiser", 3)
# submarine = Ship.new("Submarine", 2)
# board.place(cruiser, ["A1", "A2", "A3"])
# board.place(submarine, ["D4", "D3"])