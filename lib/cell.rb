class Cell
  attr_reader :coordinate, :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
  end
  
  def empty?
    if @ship == nil
      true
    else 
      false
    end
  end
  
  def place_ship(ship_obj)
    @ship = ship_obj
  end
end