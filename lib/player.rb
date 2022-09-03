class Player
  attr_reader :name, :player_ships, :board
  def initialize(name, board)
    @name = name
    @player_ships = []
    @player_board = board
  end
  
  def assign_ships(*ships)
    @player_ships << ships
    @player_ships = @player_ships.flatten
  end
end