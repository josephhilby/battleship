class Game
  attr_reader :player_one, :player_cpu, :current_turn, :debug_mode
  def initialize
    @player_one = Player.new
    @player_cpu = Player.new(true)
    @cpu_logic = nil
    @current_turn = nil
    @debug_mode = false
    @first_cell = @player_cpu.cpu_moves.sample
    @second_cell = @player_cpu.cpu_moves.sample
    @third_cell = @player_cpu.cpu_moves.sample
  end

  def start
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    loop do
      player_input_start = gets.chomp.downcase
      if player_input_start == 'p'
        self.cpu_set_up
        break
      elsif player_input_start == 'q'
        return puts "Bye bye..."
      else
        puts "Not a valid input. Please enter p to play. Enter q to quit."
      end
    end
  end

  def place_cruiser
    counter = 0
    until @player_cpu.board.valid_placement?(@player_cpu.cruiser, [@first_cell, @second_cell, @third_cell])
      @second_cell = @player_cpu.cpu_moves.sample
      @third_cell = @player_cpu.cpu_moves.sample
      counter += 1
      if counter == 100000
        break
      end
    end
    @player_cpu.board.place(@player_cpu.cruiser, [@first_cell, @second_cell, @third_cell])
  end

  def place_submarine
    counter = 0
    until @player_cpu.board.valid_placement?(@player_cpu.submarine, [@first_cell, @second_cell])
      @first_cell = @player_cpu.cpu_moves.sample
      @second_cell = @player_cpu.cpu_moves.sample
      counter += 1
      if counter == 100000
        break
      end
    end
    @player_cpu.board.place(@player_cpu.submarine, [@first_cell, @second_cell])
  end

  def cpu_set_up
    self.place_cruiser
    self.place_submarine
    self.player_setup_cruiser
  end

  def player_setup_cruiser
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts @player_one.board.render
    puts "Enter the squares for the Cruiser (3 spaces):"
    @player_cruiser_input = gets.chomp.upcase.split
    until @player_one.board.valid_placement?(@player_one.cruiser, @player_cruiser_input) && @player_cruiser_input.all? {|coord| @player_one.board.valid_coordinate?(coord)}
      puts "I'm sorry, that was not a valid position. Please try again."
      puts "Enter the squares for the Cruiser (3 spaces):"
      @player_cruiser_input = gets.chomp.upcase.split
    end
    @player_one.board.place(@player_one.cruiser, @player_cruiser_input)
    self.player_setup_submarine
  end

  def player_setup_submarine
    puts @player_one.board.render(true)
    puts "Enter the squares for the Submarine (2 spaces):"
    @player_submarine_input = gets.chomp.upcase.split
    until @player_one.board.valid_placement?(@player_one.submarine, @player_submarine_input) && @player_submarine_input.all? {|coord| @player_one.board.valid_coordinate?(coord)}
      puts "I'm sorry, that was not a valid position. Please try again."
      puts "Enter the squares for the Submarine (2 spaces):"
      @player_submarine_input = gets.chomp.upcase.split
    end
    @player_one.board.place(@player_one.submarine, @player_submarine_input)
    self.run
  end

  def run
    loop do
      @current_turn = Turn.new(@player_one, @player_cpu)
      cpu_move = current_turn.cpu_turn
      player_move = current_turn.player_turn
      puts current_turn.cpu_turn_result(cpu_move)
      puts current_turn.player_one_turn_result(player_move)
      puts current_turn.turn_render_result
      if @player_one.has_lost? || @player_cpu.has_lost?
        break
      end
    end
    @current_turn.game_loss?
  end

  def debug

  end
end