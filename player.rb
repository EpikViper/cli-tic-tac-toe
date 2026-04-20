# frozen_string_literal: true

# This class will represent our human players
class Player
  def initialize(n_turn)
    if n_turn.integer? && [1, 2].include?(n_turn)
      @turn = n_turn
      @marker = @turn == 1 ? 'X' : 'O'
    else
      TypeError
    end
  end

  private

  attr_reader :turn

  public

  attr_reader :marker

  def name
    "player #{turn}"
  end

  def make_choice # rubocop:disable Metrics/MethodLength
    row_choice = nil
    col_choice = nil

    loop do
      print "#{name} choose row: "
      row_choice = gets.chomp.to_i
      break if (1..3).include?(row_choice)
    end

    loop do
      print "#{name} choose column: "
      col_choice = gets.chomp.to_i
      break if (1..3).include?(col_choice)
    end

    [row_choice, col_choice]
  end
end
