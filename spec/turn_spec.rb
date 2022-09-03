require 'rspec'
require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  it "Test 1: exists" do
    player_1 = Player.new
    player_cpu = Player.new(true)
    turn = Turn.new(player_1, player_cpu)

    expect(turn).to be_a(Turn)
  end

  it "Test 2: has readable attributes" do
    player_1 = Player.new
    player_cpu = Player.new(true)
    turn = Turn.new(player_1, player_cpu)

    expect(turn.player_one).to eq(player_1)
    expect(turn.player_cpu).to eq(player_cpu)
  end

  it "Test 3: will render both boards" do
    player_1 = Player.new
    player_cpu = Player.new(true)
    turn = Turn.new(player_1, player_cpu)

    player_cpu.board.place(cruiser, ["A1", "A2", "A3"])
    player_1.board.place(cruiser, ["A1", "A2", "A3"])

    expect(player_cpu.board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
    expect(player_1.board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
  end

  # it "Test#: will render player and computer moves" do
  #   player_1 = Player.new
  #   player_cpu = Player.new(true)
  #   turn = Turn.new(player_1, player_cpu)

  #   player_cpu.board.place(cruiser, ["A1", "A2", "A3"])
  #   player_1.board.place(cruiser, ["A1", "A2", "A3"])

  #   allow(player_1.move).to recieve("A1").and_return(player_cpu.cruiser.hit)

  # end

  # it "Test#: will render both boards in debug mode" do
  #   player_1 = Player.new
  #   player_cpu = Player.new(true)
  #   turn = Turn.new(player_1, player_cpu)

  #   player_cpu.board.place(cruiser, ["A1", "A2", "A3"])
  #   player_1.board.place(cruiser, ["A1", "A2", "A3"])

  #   expect(player_cpu.board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
  #   expect(player_1.board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
  # end

  it "Test 4: will call for player input" do
    player_1 = Player.new
    player_cpu = Player.new(true)
    turn = Turn.new(player_1, player_cpu)

    expect(turn.start).to eq("")
  end

  it "Test 5: will print move results" do
    player_1 = Player.new
    player_cpu = Player.new(true)
    turn = Turn.new(player_1, player_cpu)

    player_cpu.board.place(cruiser, ["A1", "A2", "A3"])
    player_1.board.place(cruiser, ["A1", "A2", "A3"])


  end

  it "Test 6: will end game if player looses" do

  end
end