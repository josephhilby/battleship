require 'rspec'
require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require './lib/turn'
require './lib/game'

game = Game.new

# Un-comment if testing in debug
# game.debug_mode(true)

game.start