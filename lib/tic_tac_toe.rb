class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "------------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "------------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
    ]
    
  def move(position, player="X")
    player = current_player
    @board[position - 1] = player
  end
  
  def position_taken?(position)
    if (@board[position] == "") || (@board[position] == " ")
      return false
    else
      return true
    end
  end
  
  def valid_move?(position)
    position = position.to_i - 1
    if(position_taken?(position) == false) && (position >= 0) && (position < 10)
      return true
    else
      return false
    end
  end
  
  def turn
    position = gets.to_i
    if (valid_move?(position))
      move(position)
    else
      turn
    end
  end
  
  def turn_count
    x = 0
    count = 0
    while x < @board.length
      if (@board[x] == "X") || (@board[x] == "O")
        count += 1
      end
      x += 1
    end
    return count
  end
  
  def current_player
    if(turn_count % 2 == 0) || (turn_count == 0)
      return "X"
    else
      return "O"
    end
  end
  
  def won?
    x = 0
    while x < WIN_COMBINATIONS.length
      win_combo = WIN_COMBINATIONS[x]
      win1 = win_combo[0]
      win2 = win_combo[1]
      win3 = win_combo[2]
      if ((@board[win1] == "X") || (@board[win1] == "O")) && ((@board[win1] == @board[win2]) && (@board[win1] == @board[win3]))
        return win_combo
      end
      x += 1
    end
    return false
  end
  
  def full?
    x = 0
    while x < @board.length
      if (@board[x] == "") || (@board[x] == " ")
        return false
      end
      x += 1
    end
    return true
  end
  
  def draw?
    if (full? == true) && (won? == false)
      return true
    end
    return false
  end
  
  def over?
    if(draw?) || (won?)
      return true
    end
    return false
  end
  
  def winner
    if (won? == false)
      return nil
    else
      position = won?[0]
      return @board[position]
    end
  end
  
  def play
    until (over?) 
      turn
      
      display_board
    end
    if(won?)
      puts "Congratulations #{winner}!"
      return
    else
      puts "Cats Game!"
      return
    end
    
  end
  
end

