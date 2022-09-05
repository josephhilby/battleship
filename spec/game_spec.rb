require 'rspec'
require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Game do
  it "Test 1: exists" do
    game = Game.new

    expect(game).to be_a(Game)
  end

  it "Test 2: has readable attributes" do
    game = Game.new

    expect(game.player_one).to be_a(Player)
    expect(game.player_cpu).to be_a(Player)
    expect(game.current_turn).to eq(nil)
    expect(game.debug_mode).to eq(false)
  end

  # it "Test 3: can start a game" do
    # User input, no test required
  # end

  # it "Test 4: can setup a game" do
    # User input and tested in CPU_Logic, no test required
  # end

  it "Test 5: can run a turn" do

  end

  it "Test 6: can determine a winner" do

  end

  it "Test 7: can enter debug mode" do

  end

  xit "Test 8: will render both boards in debug mode" do
    game = Game.new

    player_cpu.board.place(cruiser, ["A1", "A2", "A3"])
    player_1.board.place(cruiser, ["A1", "A2", "A3"])

    expect(player_cpu.board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
    expect(player_1.board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
  end
end