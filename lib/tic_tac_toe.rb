class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def board
    @board
  end

  def board=(new_board)
    @board = new_board
  end

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def move(position, character = "X")

    if turn_count > 0
      if board.count("X") > board.count("O") 
        character = "O"
      else
        character = "X"
      end
    end

    board[position.to_i - 1] = character
    return board
  end

  def position_taken?(position)
    if board[position.to_i] == " " || board[position.to_i] == "" || board[position.to_i] == nil
      return false
    end

    if board[position.to_i] == "X" || board[position.to_i] == "O"
      return true
    end
  end

  def valid_move?(position)
    if (1..9).include?(position.to_i) && !(position_taken?(position.to_i - 1))
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(position) == false
      puts "Please enter 1-9:"
      position = gets.strip
    else
        move(position)
        display_board
    end
  end

  def turn_count
    count = 0
    board.each do |cell|
      if cell == "X" || cell == "O"
        count += 1
      end
    end
    return count
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      cell1 = board[combination[0]]
      cell2 = board[combination[1]]
      cell3 = board[combination[2]]

      cellsArray = [cell1, cell2, cell3]
      if cellsArray.all? {|element| element == "X"}
        return combination
      elsif cellsArray.all? {|element| element == "O"}
        return combination
      end
    end
    return false
  end

  def full?
    if board.all? {|element| element == "X" || element == "O"}
      return true
    else
      return false
    end
  end

  def draw?
    if (not won?) && full?
      return true
    else
      return false
    end
  end

  def over?
    if won? || draw? || full?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      position = won?[0]
      return board[position]
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end