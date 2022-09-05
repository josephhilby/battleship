class Turn
  attr_reader :player_one, :player_cpu
  attr_accessor :cpu_move, :player_move
  def initialize(player_one, player_cpu)
    @player_one = player_one
    @player_move = nil
    @player_cpu = player_cpu
    @cpu_move = nil
  end

  def cpu_turn
    @cpu_move = player_cpu.cpu_move
  end

  def player_turn
    @player_move = player_one.player_move
  end

  def cpu_turn_result(cpu_move)
    if @player_one.board.cells[cpu_move].empty? && !@player_one.board.cells[cpu_move].fired_upon?
      @player_one.board.cells[cpu_move].fire_upon
      "My shot on #{cpu_move} was a miss."
    elsif !@player_one.board.cells[cpu_move].fired_upon?
      @player_one.board.cells[cpu_move].fire_upon
      "My shot on #{cpu_move} was a hit."
    else
      "That square was already hit! What a waste!"
    end
  end

  def player_one_turn_result(player_move)
    if @player_cpu.board.cells[player_move].empty? && !@player_cpu.board.cells[player_move].fired_upon?
      @player_cpu.board.cells[player_move].fire_upon
      "Your shot on #{player_move} was a miss."
    elsif !@player_cpu.board.cells[player_move].fired_upon?
      @player_cpu.board.cells[player_move].fire_upon
      "Your shot on #{player_move} was a hit."
    else
      "That square was already hit! What a waste!"
    end
  end

  def turn_render_result
    "=============COMPUTER BOARD=============\n" +
    "#{@player_cpu.board.render}" +
    "==============PLAYER BOARD==============\n" +
    "#{@player_one.board.render(true)}"
  end

  def game_loss?
    if @player_one.has_lost?
      puts "I won!"
    elsif @player_cpu.has_lost?
      puts "You won!"
    end
  end
end