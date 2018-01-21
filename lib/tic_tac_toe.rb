class TicTacToe
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]
  def initialize
    @board = Array.new(9, " ")
  end
  def display_board
    print " #{@board[0]} | #{@board[1]} | #{@board[2]} \n-----------\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n-----------\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
  end
  def move(pos, player="X")
    pos = pos.to_i - 1
    @board[pos] = player
  end
  def valid_move?(pos)
    pos = pos.to_i
    if pos <=9 && pos > 0
      if !(position_taken?(pos - 1))
        true
      else
        false
      end
    else
      false
    end
  end
  def position_taken?(pos)
    pos = pos.to_i
    if @board[pos] == "X" || @board[pos] == "O"
      true
    else
      false
    end
  end
  def turn
    puts "Please enter a move 1-9!"
    players_choice = gets.strip.to_i
    if valid_move?(players_choice)
      move(players_choice, current_player)
    else
      puts "You have made an invalid move, please try again!"
      turn
    end
  end
  def turn_count
    turns_taken = 0
    @board.each {|space|
      if space == "X" || space == "O"
        turns_taken += 1
      end
      }
    return turns_taken
  end
  def current_player
    players_turn = 9 - turn_count
    if players_turn % 2 == 0
      return "O"
    else
      return "X"
    end
  end
  def draw?
    board_status = []
    WIN_COMBINATIONS.each {|combo|
      new_array = Array.new()
      combo.each {|pos|
        new_array.push(@board[pos])
        }
      if new_array.length == 3
        board_status.push(new_array)
      end
      }
    if board_status.include?(["X", "X", "X"]) || board_status.include?(["O", "O", "O"])
      false
    else
      true
    end
  end
  def full?
    if @board.any? {|pos| pos == " "} == false
      draw?
    else
      false
    end
  end
  def winning_combo
    board_status = []
    WIN_COMBINATIONS.each {|combo|
      new_array = Array.new()
      combo.each {|pos|
        new_array.push(@board[pos])
        }
      if new_array.length == 3
        board_status.push(new_array)
      end
      if board_status.include?(["X", "X", "X"]) || board_status.include?(["O", "O", "O"])
        return combo
      end
      }
  end
  def won?
    if @board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      false
    elsif draw?
      false
    else
      winning_combo
    end
  end
  def over?
    if won?.class == Array
      true
    elsif full? == false
      false
    else
      true
    end
  end
  def winner
    if won?.class == Array
      player_won = won?
      @board[player_won[0]]
    else
      nil
    end
  end
  def play
    display_board
    stop = false
    while !(stop)
      if full?
        puts "Cats Game!"
        stop = true
      elsif over?
        puts "Congratulations #{winner}!"
        stop = true
      else
        turn
      end
    end
  end
end