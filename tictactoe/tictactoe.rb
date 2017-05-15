require_relative 'board'
require_relative 'player'

class TicTacToe
  
  attr_accessor :move, :board

  def initialize
    @pieces = {}
    @players= []
    @turn = rand(2)
  end
  
  def players
    @players
  end
  
  def start
    2.times { players.push(Player.new) }
    @board = Board.new(3)
    turn
  end
  
  def turn
    board.draw_board(@pieces)
    if win_state(@pieces) == 1
      puts "#{@players[@turn].name}'s turn: "
      validate_move(gets.chomp)
    else
      puts "Game Over - #{@players[@turn].name} wins"
    end
  end
  
  def validate_move(move)
    if !(@pieces.has_key? move) && (move =~ /^[0-2][0-2]$/)
      @turn == 0 ? @pieces[move] = 'x' : @pieces[move] = 'o'
      @turn == 0 ? @turn = 1 : @turn = 0 if win_state(@pieces) == 1
    end
    turn
  end
  
  def win_state(pieces)
    ['x','o'].each do |m|
      tally = [[0,0,0],[0,0,0],[0,0,0]]
      pieces.each do |k, v| #convert pieces to 2d array
        if v == m
          tally[k[0].to_i][k[1].to_i] +=1
        end
      end
      
      tally.each do |x| #rows
       return 0 if x.all? { |i| i == 1 }
      end
      
      (0..tally.size-1).each do |x| #columns
        return 0 if [tally[0][x],tally[1][x],tally[2][x]].all? {|j| j == 1}
      end
      
      #diagonals
      return 0 if [tally[0][0],tally[1][1],tally[2][2]].all? {|j| j == 1}
      return 0 if [tally[0][2],tally[1][1],tally[2][0]].all? {|j| j == 1}
      
    end
    return 1
  end

end
