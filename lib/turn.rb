class Turn
  attr_reader :player_one, :player_cpu
  def initialize(player_one, player_cpu)
    @player_one = player_one
    @player_cpu = player_cpu
  end

  def turn_render
    puts "=============COMPUTER BOARD============="
    player_cpu.board.render
    puts "==============PLAYER BOARD=============="
    player_one.board.render
  end

  def cpu_turn_move
    cpu_move = player_cpu.cpu_move
    if player_one.board.cells[cpu_move].empty?
      puts "My shot on #{cpu_move} was a miss."
    elsif !player_one.board.cells[cpu_move].fired_upon?
      player_one.board.cells[cpu_move].fire_upon
      puts "My shot on #{cpu_move} was a hit."
    else
      "That square was already hit! What a waste!"
    end
  end

  def player_one_turn_move
    player_move = player_one.move
    if player_cpu.board.cells[player_move].empty?
      puts "Your shot on #{player_move} was a miss."
    elsif !player_cpu.board.cells[player_move].fired_upon?
      player_cpu.board.cells[player_move].fire_upon
      puts "Your shot on #{player_move} was a hit."
    else
      "That square was already hit! What a waste!"
    end
  end

  def turn_render_result
    puts "=============COMPUTER BOARD============="
    player_cpu.board.render
    puts "==============PLAYER BOARD=============="
    player_one.board.render
  end

  def game_loss?
    if !player_one.has_lost?
      "I won!"
    elsif !player_cpu.has_lost?
      "You won!"
    else
      false
    end
  end
end