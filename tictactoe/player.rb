class Player
  
  attr_accessor :name, :score
  @@player_count = 0
  
  def initialize
    puts "Enter player name: "
    @name = gets.chomp
    @@player_count += 1
  end
  
end
