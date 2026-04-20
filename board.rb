# class we'll use to track game states across the board
class Board
  def initialize(size)
    @board = Array.new(size) { Array.new(size, nil) }
  end

  def update_board(x, y, marker)
    board[x][y] = marker
  end

  private

  attr_reader :board

  public

  def display
    puts ''
    board.each do |row|
      print row
      print "\n"
    end
  end
end
