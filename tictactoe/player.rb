class Player
  
  attr_accessor :score
  @@player_count = 0
  
  def initialize(name)
    @name = name
    @@player_count += 1
  end
  
  def name
    @name
  end
  
end
