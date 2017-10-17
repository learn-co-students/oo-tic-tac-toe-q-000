class TicTacToe
  def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end

  WIN_COMBINATIONS = [
    [0,1,2], # Top Row
    [3,4,5], # Middle Row
    [6,7,8], # Bottom Row
    [0,4,8], # Top-Left, Middle, Bottom-right
    [2,4,6], # Top-Right, Middle, Bottom-left
    [0,3,6], # Left Row
    [1,4,7], # Middle Row
    [2,5,8] # Right Row
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, token)
    @board[location.to_i - 1] = token
  end

  def position_taken?(position)
    if @board[position] == " " || @board[position] == "" || @board[position] == nil
      false
    elsif @board[position] == "X" || @board[position] == "O"
      true
    end
  end

  def valid_move?(move)
    interger = move.to_i - 1
    if position_taken?(interger) == true
      false
    elsif position_taken?(interger) == false && interger.between?(0,8) == true
      true
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
      @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
      turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    empty_board = @board.all? do |empty|
      empty == " "
    end

    if empty_board == true
      return false
    else WIN_COMBINATIONS.each do |wins|
          if @board[wins[0]] == "X" && @board[wins[1]] == "X" && @board[wins[2]] == "X"
            return wins
          elsif @board[wins[0]] == "O" && @board[wins[1]] == "O" && @board[wins[2]] == "O"
            return wins
          end
        end
        return false
    end
  end

  def full?
    full_board = @board.all? do |full|
      full == "X" || full == "O"
    end
  end

  def draw?
    return true if full? && won? == false
    return false if won? == false && full? == false
  end

  def over?
    if draw? || full? || won?
      true
    end
  end

  def winner
    if over?
      return @board[won?[0]]
    end
  end

  def play
    puts "How about a game of Chess?"
    display_board

    until over?
        turn
    end

    if draw?
      puts "Cats Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end

end
