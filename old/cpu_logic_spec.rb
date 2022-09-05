require 'rspec'
require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/cpu_logic'

RSpec.describe CPU_Logic do
  it "Test 1: exists" do
    game = Game.new
    logic = CPU_Logic.new(game.player_cpu)

    expect(logic).to be_a(CPU_Logic)
  end

  it "Test 2: can place ships" do
    game = Game.new
    logic = CPU_Logic.new(game.player_cpu)

    logic.place_cruiser
    logic.place_submarine
    expect((game.player_cpu.board.render(true)).count('S')).to eq(5)
  end
end