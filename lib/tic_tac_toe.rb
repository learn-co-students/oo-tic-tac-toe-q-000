class TicTacToe
  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]

  def initialize
      @board = Array.new(9, " ")
  end

  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "------------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "------------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
      input.to_i - 1
  end

  def move(index, char)
      @board[index] = char
  end

  def position_taken?(index)
      !(@board[index] == " " || @board[index] == "")
  end

  def valid_move?(index)
      if index.between?(0,8)
          !position_taken?(index)
      end
  end

  def turn_count
      counter = 0
      @board.each_with_index do |e,i|
        if position_taken?(i)
          counter += 1
        end
      end
      counter
  end

  def current_player
      if turn_count % 2 == 0
          return "X"
      else
          return "O"
      end
  end

  def turn
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      if valid_move?(index)
          move(index, current_player)
          display_board
      else
          turn
      end
  end

  def won?
      WIN_COMBINATIONS.each do |wc|
          i1 = wc[0]
          i2 = wc[1]
          i3 = wc[2]
          if @board[i1] == "X" && @board[i2] == "X" && @board[i3] == "X" 
              return wc
          elsif @board[i1] == "O" && @board[i2] == "O" && @board[i3] == "O" 
              return wc
          end
      end
      return false
  end

  def full?
      @board.all?{|e| e == "X" || e == "O"}
  end
  
  def draw?
      full? && !won?
  end
  
  def over?
      draw? || won?
  end
  
  def winner
      if arr = won?
          return @board[arr[0]]
      end
  end

  def play
      until over?
          turn
      end
      if won?
          puts "Congratulations #{winner}!"
      elsif 
          puts "Cat's Game!"
      end
  end
end
