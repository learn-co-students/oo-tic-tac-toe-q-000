class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # bottom row
  [0,3,6],  #left column
  [1,4,7],  #mid column
  [2,5,8],  #right column
  [0,4,8],  #left diag
  [6,4,2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  def move (location, current_player = "X")
    @board[location.to_i-1] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
    else
      turn
    end
    display_board
  end

   def turn_count
    @board.count{|spot| spot == "X" || spot == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    empty = true
    @board.none? do |int|
      if int == "X"  || int == "O"
      empty = false
      end
    end
      if empty == false
        TicTacToe::WIN_COMBINATIONS.any? do |win_combo|
        win_index_1 = win_combo[0]
        win_index_2 = win_combo[1]
        win_index_3 = win_combo[2]

        pos_1 = @board[win_index_1]
        pos_2 = @board[win_index_2]
        pos_3 = @board[win_index_3]

        if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
          return win_combo
        elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
           return win_combo
        else
          false
        end
      end
      end
  end

  def full?
    if !@board.include?(" ") && !@board.include?(nil)
      return true
    end
  end

  def draw?
    if !won? && full?
      return true
    elsif !won? && full?
      return false
    elsif won?
      return false
    end
  end

  def over?
    if won? || draw? ||  full?
      return true
    end
  end

  def winner
    if won?
      if @board[won?[0]]  == "X"
        return "X"
      elsif @board[won?[0]] == "O"
        return "O"
      end
    else
       return nil
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