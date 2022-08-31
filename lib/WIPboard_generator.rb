# Code will eventually allow player to select size
letters = ["A", "B", "C", "D"]
numbers = [1, 2, 3, 4]

board_coord = letters.map do |letter|
  numbers.map do |number|
    (letter + number.to_s)
  end
end