class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

 WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],  #Row
    [0,3,6],[1,4,7],[2,5,8],  #Column
    [0,4,8],[6,4,2]           #Diagonal
    ]

  def move(position, char = "X")
    position = position.to_i - 1
    char = current_player
    @board[position] = char
  end

  def position_taken?(position)
    if @board[position] == "X" || @board[position] == "O"
      return true
    elsif @board[position] == " " || @board[position] == nil
      return false
    end
  end

  def valid_move?(position)
    position = position.to_i - 1
    if !(position_taken?(position)) && position.between?(0,8)
      return true
    else
      return false
    end
  end

  def turn
    puts "Select a move position: 1-9"
    position = gets.strip

    if valid_move?(position)
       move(position)
    else
      puts "Invalid move"
      turn
    end
  end

  def turn_count
    @board.count("X") + @board.count("O")
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      if @board[win_combination[0]] != " " && ((@board[win_combination[0]] == @board[win_combination[1]]) && (@board[win_combination[1]] == @board[win_combination[2]]))
        return true
      end
    end
    return false
  end

  def full?
    @board.none? {|i| i == " "}
  end

  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end

  def over?
    if draw? || won?
      return true
    else
      return false
    end
  end

  def winner
    if @board.count("X") > @board.count("O") && won?
      return "X"
    elsif @board.count("X") < @board.count("O") && won?
      return "O"
    else return nil
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