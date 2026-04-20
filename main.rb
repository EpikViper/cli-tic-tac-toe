require_relative 'board'
require_relative 'player'

def main # rubocop:disable Metrics/MethodLength
  # initialize game variables.
  game_board = Board.new(3)
  player_one = Player.new(1)
  player_two = Player.new(2)
  turn = 1

  loop do
    current_player = turn == 1 ? player_one : player_two
    play_round(game_board, current_player)
    if board.won?
      print "Great job. You won #{current_player.name}"
      break
    elsif board.full?
      print 'Hehee, it\'s a draw'
      break
    end
    turn -= 1
  end
end

def play_round(board, player) # rubocop:disable Metrics/MethodLength
  board.display
  print ''
  row_choice, col_choice = nil

  loop do
    print "\n"
    row_choice, col_choice = player.make_choice
    break if board.valid_choice?(row_choice, col_choice)

    print "\n"
    print 'You can\'t put that here'
  end

  board.update_board(row_choice, col_choice, player)
end
