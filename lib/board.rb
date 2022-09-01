class Board
  attr_reader :cells
  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coord)
    @cells.keys.include?(coord)
  end

  def valid_placement?(ship, coord_array)
    # coord are in board
    coord_array.find do |coord|
      valid_coordinate?(coord) == false
    end
    # coord fit ship
    coord_array.length == ship.length
    # coord cant fit 2 ship
    coord_array.find do |coord|
      @cells[coord].empty?
    end
    # coord must be in a row or column
    coord_array.map do |coord|
      coord.chars
    end
  end
end