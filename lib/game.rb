class Game
  attr_reader :player_one, :player_cpu, :current_turn, :debug_mode
  def initialize
    @player_one = Player.new
    @player_cpu = Player.new(true)
    @current_turn = nil
    @debug_mode = false
    @first_cell = @player_cpu.cpu_moves.sample
    @second_cell = @player_cpu.cpu_moves.sample
    @third_cell = @player_cpu.cpu_moves.sample
  end

  def debug_mode(true_or_false)
    @debug_mode = true_or_false
  end

  def start
    @player_one = Player.new
    @player_cpu = Player.new(true)
    puts "Welcome to BATTLESHIP!"
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

  # In testing cpu places ship with counter at around 100-200. Will need to refactor
  # if ship is bigger or more than 2 ships are used. If counter is reached, cpu will
  # select 3 bad coord and not place ship. Game is then unwinnable for player.
  # Currently this is unlikely, as 16 ** 3 == 4_096 and counter can go to 100_000.
  def place_cruiser
    counter = 0
    until @player_cpu.board.valid_placement?(@player_cpu.cruiser, [@first_cell, @second_cell, @third_cell])
      @second_cell = player_cpu.cpu_moves.sample
      @third_cell = player_cpu.cpu_moves.sample
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
      @first_cell = player_cpu.cpu_moves.sample
      @second_cell = player_cpu.cpu_moves.sample
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
    puts "I have placed my ships on the grid."
    puts "You now need to place your ships."
    puts "The Cruiser is three units long and th Submarine is two units long."
    puts @player_one.board.render
    puts "Enter the coordinates for the Cruiser (3 spaces):"
    @player_cruiser_input = gets.chomp.upcase.split
    until @player_cruiser_input.length == 3 && @player_cruiser_input.all? {|coord| @player_one.board.valid_coordinate?(coord)} && @player_one.board.valid_placement?(@player_one.cruiser, @player_cruiser_input)
      puts "I'm sorry, that was not a valid position. Please try again."
      puts "Enter the coordinates for the Cruiser (3 spaces):"
      @player_cruiser_input = gets.chomp.upcase.split
    end
    @player_one.board.place(@player_one.cruiser, @player_cruiser_input)
    self.player_setup_submarine
  end

  def player_setup_submarine
    puts @player_one.board.render(true)
    puts "Enter the coordinates for the Submarine (2 spaces):"
    @player_submarine_input = gets.chomp.upcase.split
    until @player_submarine_input.length == 2 && @player_submarine_input.all? {|coord| @player_one.board.valid_coordinate?(coord)} && @player_one.board.valid_placement?(@player_one.submarine, @player_submarine_input)
      puts "I'm sorry, that was not a valid position. Please try again."
      puts "Enter the coordinates for the Submarine (2 spaces):"
      @player_submarine_input = gets.chomp.upcase.split
    end
    @player_one.board.place(@player_one.submarine, @player_submarine_input)
    puts @player_one.board.render(true)
    self.run
  end

  def run
    loop do
      @current_turn = Turn.new(@player_one, @player_cpu)
      cpu_move = @current_turn.cpu_turn
      player_move = @current_turn.player_turn
      puts @current_turn.cpu_turn_result(cpu_move)
      puts @current_turn.player_one_turn_result(player_move)
      if @debug_mode
        puts @current_turn.debug_turn_render_result
      else
        puts @current_turn.turn_render_result
      end
      if @player_one.has_lost? || @player_cpu.has_lost?
        break
      end
    end
    @current_turn.game_loss?
    self.start
  end
end