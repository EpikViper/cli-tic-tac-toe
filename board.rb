# frozen_string_literal: true

require_relative 'player'

# class we'll use to track game states across the board
class Board
  def initialize(size)
    @board = Array.new(size) { Array.new(size, nil) }
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
end
