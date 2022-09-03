class Player
  attr_reader :cpu, :board, :cruiser, :submarine
  def initialize(cpu = false)
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @cpu = cpu
    @cpu_moves = @board.cells.keys
  end
  
  def cpu_move
    if @cpu
      @cpu_moves.shuffle!
      @cpu_moves.pop
    end
  end
  
  def has_lost?
    @cruiser.health == 0 && @submarine.health == 0
  end
  
end