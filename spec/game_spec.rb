require 'rspec'
require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

RSpec.describe Game do
  it "Test 1: exists" do
    board = Board.new
    game = Game.new(board)
    
    expect(game).to be_a(Game)
  end
  
  it 'Test 2: has readable attributes' do
    board = Board.new
    game = Game.new(board)
        
    expect(game.board).to eq(board)
  end
  
  it 'Test 3: can start a game' do
    board = Board.new
    game = Game.new(board)
    
    expect(game.start).to eq(game.setup)
  end
  
  it 'Test 4: can run a game' do
    cruiser_1 = Ship.new("Cruiser", 3)
    cruiser_2 = Ship.new("Cruiser", 3)
    board = Board.new
    game = Game.new(board)
    board.place(cruiser_1, ["A1", "A2", "A3"])
    board.place(cruiser_1, ["B1", "B2", "B3"])
    
    
  end
  
  it 'Test 5: will update the board' do
  end
  
  it 'Test 6: will end when one player has no remaining ships' do
  end
end