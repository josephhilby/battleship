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
    binding.pry
    coord_array.sort!
    length_fit = coord_array.length == ship.length
    no_other_ship = coord_array.count {|coord| @cells[coord].empty?} == coord_array.length
    check_coord = coord_array.map {|coord| coord.chars}
    in_row = check_coord.all? {|nest_arr| check_coord[0][0] == nest_arr[0]} && check_coord.all? {|first, second| first[1].to_i + 1 == second[1]}
    in_column = check_coord.all? {|nest_arr| check_coord[0][1] == nest_arr[1]} &&



    if length_fit && no_other_ship
  end
end


# coord are in board, probibly not needed because of valid_coord method
    # coord_array.find do |coord|
    #   valid_coordinate?(coord) == false
    # end
    #     ord_value_array = coord_array.map {|coord| coord.chars}.map do |coord|
    #   coord[0].ord
    # end
    # ord_value = ord_value_array == ord_value_array.sort