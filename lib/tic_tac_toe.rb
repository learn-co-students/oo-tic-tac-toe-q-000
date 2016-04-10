class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, token="X")
    @board[location.to_i-1] = token
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Player #{current_player}, please enter 1-9:"
    input = gets
    if valid_move?(input) == false
      turn
    elsif current_player == "X"
      move(input, "X")
      display_board
    elsif  current_player == "O"
      move(input, "O")
      display_board
     end
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def won?
  WIN_COMBINATIONS.each do |firstlevel|
    if @board[firstlevel[0]] == "X" && @board[firstlevel[1]] == "X" && @board[firstlevel[2]] == "X"
      return firstlevel
    elsif @board[firstlevel[0]] == "O" && @board[firstlevel[1]] == "O" && @board[firstlevel[2]] == "O"
      return firstlevel
    end
  end
  return false
  end

  def full?
    if @board.include?("") || @board.include?(" ") || @board.include?(nil)
      return false
    else
      return true
    end
  end

  def draw?
    if full? == true && won? == false
      return true
    else
      return false
    end
  end

  def over?
    if draw? == true || won?!= false
      return true
    else
      return false
    end
  end

  def winner
    thewinner = won?
    if thewinner != false
      if @board[thewinner[0]] == "O"
        return "O"
      elsif @board[thewinner[0]] == "X"
        return "X"
      end
    end
  end

  def play
    if draw? == true
      puts "Cats Game!"
    else
      puts "Congratulations #{winner}!"
    end
    until over? == true
      turn
      if draw? == true
        puts "Cats Game!"
      else
        puts "Congratulations #{winner}!"
      end
    end
   end

end

