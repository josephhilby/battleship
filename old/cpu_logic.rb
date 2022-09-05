class CPU_Logic
  def initialize(cpu)
    @cpu = cpu
    @board = cpu.board
    @cruiser = cpu.cruiser
    @submarine = cpu.submarine
    @first_cell = @cpu.cpu_moves.sample
    @second_cell = @cpu.cpu_moves.sample
    @third_cell = @cpu.cpu_moves.sample
  end

  def place_cruiser
    counter = 0
    until @board.valid_placement?(@cruiser, [@first_cell, @second_cell, @third_cell])
      @second_cell = @cpu.cpu_moves.sample
      @third_cell = @cpu.cpu_moves.sample
      counter += 1
      if counter == 100000
        break
      end
    end
    @board.place(@cruiser, [@first_cell, @second_cell, @third_cell])
  end

    def place_submarine
    counter = 0
    until @board.valid_placement?(@submarine, [@first_cell, @second_cell])
      @first_cell = @cpu.cpu_moves.sample
      @second_cell = @cpu.cpu_moves.sample
      counter += 1
      if counter == 100000
        break
      end
    end
    @board.place(@submarine, [@first_cell, @second_cell])
  end
end