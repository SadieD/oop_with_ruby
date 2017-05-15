require_relative 'mastermind'
require_relative 'mastermindai'

game = MasterMind.new
game.start

if game.mode == 2
  ai = MasterMindAI.new
end

while game.state == 1
  if game.mode == 1
    puts "Enter a code: "
    game.turn(gets.chomp)
  else
    game.turn(ai.guess(game.hint))
  end
end
