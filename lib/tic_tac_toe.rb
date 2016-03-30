class TicTacToe
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


  # Define your play method below
  def play()

    until over?()
      turn()
    end

    if won?()
      puts "Congratulations " + winner() + "!"
    elsif draw?()
      puts "Cats Game!"
    else
    end


  end



  # Helper Method
  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end


  #def position_taken?(board, location)
  #  board[location] != " " && board[location] != ""
  #end


  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [3,4,5],  # Middle row
    [0,1,2],  # Top row
    [6,7,8],  # Middle row
    [0,3,6],  # Middle row
    [1,4,7],  # Middle row
    [2,5,8],  # Middle row
    [0,4,8],  # Middle row
    [2,4,6],  # Middle row
  ]

  def won?()
    TicTacToe::WIN_COMBINATIONS.each do |win_combo|
      if @board[win_combo[0]]!=" " && @board[win_combo[0]]==@board[win_combo[1]] && @board[win_combo[1]]==@board[win_combo[2]]
        return win_combo
      end
    end
    return false
  end

  def full?()
    return @board.count(" ") == 0
  end

  def draw?()
    return !won?() && full?()
  end

  def over?()
    return won?() || draw?()
  end

  def winner()
    if !won?()
      return nil
    else
      return @board[won?()[0]]
    end

  end

  def move(location, current_player = "X")
    @board[location.to_i-1] = current_player
  end


  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn()
    puts "Please enter 1-9:"

    input = gets.strip
    if valid_move?(input)
      move(input,current_player())
    else
      turn()
    end
    display_board()
  end



end