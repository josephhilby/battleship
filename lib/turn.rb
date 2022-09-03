class Turn
  attr_reader :player_one, :player_cpu
  def initialize(player_one, player_cpu)
    @player_one = player_one
    @player_cpu = player_cpu
  end
end