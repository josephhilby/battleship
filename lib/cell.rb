class Cell
  attr_reader :coordinate, :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = false
  end

  # @ship.nil? (return true or false)
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
      @fired_upon = true
      ship.hit
    else
      @fired_upon = true
    end
  end

  # try axing the first 2, == true is extra just do true, if == false just do !object
  def render(value = false)
    if value && @fired_upon == true && @ship != nil && ship.sunk? == true
      return "X"
    elsif value && @fired_upon == true && self.empty? == false
      return "H"
    elsif value && self.empty? == false
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