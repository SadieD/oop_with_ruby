#creates a grid type board, draws pieces to board
class Board

  def initialize(grid_size)
    @grid_size = grid_size
    @board = []
    grid_size.times { @board += ["|" + '   |'* grid_size] }
  end
  
  def draw_board(pieces)
    system "clear"
    pieces.each { |k, v| @board[k[0].to_i][2 + (k[1].to_i * 4)] = v.to_s }
    puts '-' * (4 * @grid_size)
    @board.each_with_index { |x, i| puts x; puts ('-' * (4 * @grid_size)) if i % 2 }
  end
  
end
