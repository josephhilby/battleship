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
  end

  it "Test 3: can place ships" do
    game = Game.new

    game.place_cruiser
    expect((game.player_cpu.board.render(true)).count('S')).to eq(3)
    game.place_submarine
    expect((game.player_cpu.board.render(true)).count('S')).to eq(5)
  end

  it "Test 4: will render both boards in debug mode" do
    game = Game.new
    game.debug_mode(true)
    binding.pry

    game.player_cpu.board.place(player_cpu.cruiser, ["A1", "A2", "A3"])
    game.player_1.board.place(player_1.cruiser, ["A1", "A2", "A3"])

    expect(player_cpu.board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
    expect(player_1.board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
  end
end