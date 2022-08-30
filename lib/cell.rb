class Cell
  attr_reader :coordinate, :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = false
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
  
  def fired_upon?
    @fired_upon
  end
  
  def fire_upon
    if @ship != nil
      ship.hit
      @fired_upon = true
    else 
      @fired_upon = true
    end
  end
  
  def render(value = false)
    if value && self.empty? == false
      return "S"
    elsif @fired_upon == false
      return "."
    elsif @fired_upon == true && @ship != nil && ship.sunk? == true
      return "X"
    elsif @fired_upon == true && self.empty? == false
      return "H"
    elsif @fired_upon == true
      return "M"
    end
  end
end