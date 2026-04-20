# frozen_string_literal: true

require_relative 'player'

# class we'll use to track game states across the board
class Board
  def initialize
    @board = Array.new(3) { Array.new(3, nil) }
  end

  def update_board(x, y, player) # rubocop:disable Naming/MethodParameterName
    board[x - 1][y - 1] = player.marker
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

  def valid_choice?(row, col)
    board[row - 1][col - 1].nil?
  end

  def full?
    board.flatten.all?
  end

  def won?
    all_paths.any? { |path| check_path(path) }
  end

  private

  def check_path(path)
    path.count('X') == 3 || path.count('O') == 3
  end

  def all_paths # rubocop:disable Metrics/AbcSize
    rows = board
    cols = board.transpose
    diags = [
      [board[0][0], board[1][1], board[2][2]],
      [board[2][0], board[1][1], board[0][2]]
    ]
    rows + cols + diags
  end
end
