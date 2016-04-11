class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], [0,3,6],
  [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def play
    while !over?
      turn
    end
      if won?
      puts "Congratulations #{winner}!"
      else draw?
        puts "Cats Game!"
      end
  end

  def move(position, token = "X")
    @board[position.to_i-1] = token
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    if !valid_move?(position)
      puts "Invalid, please try again:"
      turn
    end
    move(position, current_player)
    display_board
  end

    def turn_count
      counter = 0
      @board.each do |token|
        if token == "X" || token == "O"
          counter += 1
        end
      end
      counter
    end

    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end

    def won?
      WIN_COMBINATIONS.each do |win_combo|
        if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
          return win_combo
        elsif @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
          return win_combo
        end
      end
      nil
    end

    def full?
      @board.all? do |i|
        i == 'X' || i == 'O'
      end
    end

    def draw?
      if won? || !full?
        false
      else
        true
      end
    end

    def over?
      if won? || draw?
        true
      else
        false
      end
    end

    def winner
      if won?
        return @board[won?[0]]
      else
        nil
      end
    end
  end
