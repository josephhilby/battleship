require 'rspec'
require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require './lib/turn'
require './lib/game'

game = Game.new

# Un-comment to enter debug mode
game.debug_mode(true)

game.start