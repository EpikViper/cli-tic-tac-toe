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
end
