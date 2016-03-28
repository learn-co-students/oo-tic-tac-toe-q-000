class TicTacToe
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]]

  def initialize
      @board = [" "," "," "," "," "," "," "," "," "]
       board = @board
  end
  def display_board(board)

      puts (" #{array[0]} | #{array[1]} | #{array[2]} ")
      puts ("-----------")
      puts (" #{array[3]} | #{array[4]} | #{array[5]} ")
      puts ("-----------")
      puts (" #{array[6]} | #{array[7]} | #{array[8]} ")
  end




end
