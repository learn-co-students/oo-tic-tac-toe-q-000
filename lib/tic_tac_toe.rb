class TicTacToe
  WIN_COMBINATIONS = [
      [0,1,2], [3,4,5], [6,7,8],  # horizontal
      [0,3,6], [1,4,7], [2,5,8],  # vertical
      [0,4,8], [6,4,2]            # diagonal
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position,char)
    @board[position.to_i - 1] = char
  end

  def position_taken?(position)
    !(@board[position] == " " || @board[position] == nil || @board[position] == "")
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !(position_taken?(position.to_i-1))
  end

  def turn
    puts "Please enter 1-9:"
    position = gets
    if !valid_move?(position)
      turn
    end
    move(position, current_player)
    display_board
  end

  def won?
    WIN_COMBINATIONS.each do |win_comb|
      a = win_comb[0]
      b = win_comb[1]
      c = win_comb[2]
      position_a = @board[a]
      position_b = @board[b]
      position_c = @board[c]
      if position_a == "X" && position_b == "X" && position_c == "X"
        return win_comb
      elsif position_a == "O" && position_b == "O" && position_c == "O"
        return win_comb
      end
    end
    return false
  end

  def full?
    !(@board.include?(" "))
  end

  def draw?
    !won? && full?
  end

  def over?
    full? || won? || draw?
  end

  def winner
    if won? == false
      return nil
    else
      win_comb = won?
      return "#{@board[win_comb.first]}"
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end