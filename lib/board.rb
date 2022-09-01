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

  def place(ship, coord_array)
    coord_array.each do |coord|
      if valid_coordinate?(coord)
        @cells[coord].place_ship(ship)
      end
    end
  end

  def render(is = false)
    cell_render = @cells.values.map do |value|
      value.render(is)
    end
    "  1 2 3 4 \n" +
    "A #{cell_render[0]} #{cell_render[1]} #{cell_render[2]} #{cell_render[3]} \n" +
    "B #{cell_render[4]} #{cell_render[5]} #{cell_render[6]} #{cell_render[7]} \n" +
    "C #{cell_render[8]} #{cell_render[9]} #{cell_render[10]} #{cell_render[11]} \n" +
    "D #{cell_render[12]} #{cell_render[13]} #{cell_render[14]} #{cell_render[15]} \n"
  end

  def valid_placement?(ship, coord_array)
    coord_array.sort!
    length_fit = coord_array.length == ship.length
    no_other_ship = coord_array.count {|coord| @cells[coord].empty?} == coord_array.length
    check_coord = coord_array.map {|coord| coord.chars}
    in_row = (check_coord.all? {|nest_arr| check_coord[0][0] == nest_arr[0]}) && (check_coord.map {|nest_arr| nest_arr[1]} == (check_coord[0][1]..check_coord[-1][1]).to_a)
    in_column = (check_coord.all? {|nest_arr| check_coord[0][1] == nest_arr[1]}) && (check_coord.map {|nest_arr| nest_arr[0]} == (check_coord[0][0]..check_coord[-1][0]).to_a)
    if (in_row || in_column) && length_fit && no_other_ship
      true
    else
      false
    end
  end
end