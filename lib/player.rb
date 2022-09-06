class Player
  attr_reader :cpu, :board, :cruiser, :submarine, :cpu_moves
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

  def player_move
    puts "Enter the coordinate for your shot:"
    loop do
      player_move = gets.chomp.upcase
      if @board.valid_coordinate?(player_move)
        return player_move
      else
        puts "Please enter a valid coordinate:"
      end
    end
  end

  def has_lost?
    @cruiser.health == 0 && @submarine.health == 0
  end
end