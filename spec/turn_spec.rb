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

    player_cpu.board.place(player_cpu.cruiser, ["A1", "A2", "A3"])
    player_1.board.place(player_1.cruiser, ["A1", "A2", "A3"])

    expect(turn.turn_render_result).to eq("=============COMPUTER BOARD=============\n" + "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n" + "==============PLAYER BOARD==============\n" + "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
  end

  it "Test 4: will print player and computer moves" do
    player_1 = Player.new
    player_cpu = Player.new(true)
    turn = Turn.new(player_1, player_cpu)

    player_cpu.board.place(player_cpu.cruiser, ["A1", "A2", "A3"])
    player_1.board.place(player_1.cruiser, ["A1", "A2", "A3"])

    turn.player_move = "A1"
    turn.cpu_move = "B1"

    expect(turn.player_one_turn_result(turn.player_move)).to eq("Your shot on #{turn.player_move} was a hit.")
    expect(turn.cpu_turn_result(turn.cpu_move)).to eq("My shot on #{turn.cpu_move} was a miss.")
  end

  it "Test 5: will render player and computer result" do
    player_1 = Player.new
    player_cpu = Player.new(true)
    turn = Turn.new(player_1, player_cpu)

    player_cpu.board.place(player_cpu.cruiser, ["A1", "A2", "A3"])
    player_1.board.place(player_1.cruiser, ["A1", "A2", "A3"])

    turn.player_move = "A1"
    turn.cpu_move = "B1"
    turn.player_one_turn_result(turn.player_move)
    turn.cpu_turn_result(turn.cpu_move)

    expect(turn.turn_render_result).to eq("=============COMPUTER BOARD=============\n" + "  1 2 3 4 \nA H . . . \nB . . . . \nC . . . . \nD . . . . \n" + "==============PLAYER BOARD==============\n" + "  1 2 3 4 \nA S S S . \nB M . . . \nC . . . . \nD . . . . \n")
  end

  it "Test 6: will call for player input" do
    player_1 = Player.new
    player_cpu = Player.new(true)
    turn = Turn.new(player_1, player_cpu)

    player_cpu.board.place(player_cpu.cruiser, ["A1", "A2", "A3"])
    player_1.board.place(player_1.cruiser, ["A1", "A2", "A3"])
    player_cpu.board.place(player_cpu.submarine, ["C1", "C2"])
    player_1.board.place(player_1.cruiser, ["C1", "C2"])

    expect(turn.game_loss?).to be(false)
    turn.player_move = "A1"
    turn.cpu_move = "B1"
    turn.player_one_turn_result(turn.player_move)
    turn.cpu_turn_result(turn.cpu_move)
    turn.player_move = "A2"
    turn.cpu_move = "B2"
    turn.player_one_turn_result(turn.player_move)
    turn.cpu_turn_result(turn.cpu_move)
    turn.player_move = "A3"
    turn.cpu_move = "B3"
    turn.player_one_turn_result(turn.player_move)
    turn.cpu_turn_result(turn.cpu_move)
    turn.player_move = "C1"
    turn.cpu_move = "B4"
    expect(turn.game_loss?).to be(false)

    turn.player_one_turn_result(turn.player_move)
    turn.cpu_turn_result(turn.cpu_move)
    turn.player_move = "C2"
    turn.cpu_move = "D1"
    turn.player_one_turn_result(turn.player_move)
    turn.cpu_turn_result(turn.cpu_move)
    expect(turn.game_loss?).to eq("You won!")
  end
end

# Move test to Game class debug mode once made
  # it "Test 4: will render both boards in debug mode" do
  #   player_1 = Player.new
  #   player_cpu = Player.new(true)
  #   turn = Turn.new(player_1, player_cpu)

  #   player_cpu.board.place(cruiser, ["A1", "A2", "A3"])
  #   player_1.board.place(cruiser, ["A1", "A2", "A3"])

  #   expect(player_cpu.board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
  #   expect(player_1.board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
  # end