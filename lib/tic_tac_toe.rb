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

  def move(location, character="X") 
    character = current_player
    @board[location-1] = character
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    position = position.to_i
    if position.between?(1,9) && !position_taken?(position-1)
      return true
    end
    return false
  end

  def turn
      puts "Please enter 1-9:"
      position = gets.strip
      position = position.to_i
      if valid_move?(position.to_s)
          move(position)
      else
          turn
      end
      display_board
  end

  def turn_count
    count = 0
    @board.each {|position| 
      if position != " "
        count +=1
      end
    }
  return count
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
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

  def won?
    WIN_COMBINATIONS.each do |win_combo_array|
      count = 0
        win_combo_array.each do |win_elements|
          if @board[win_elements] == "X"
            count +=1
          end
       end

        if count == 3 || count == 0 && position_taken?(win_combo_array[0]) && position_taken?(win_combo_array[1]) && position_taken?(win_combo_array[2])
          return win_combo_array
        end
      end  
    return false
  end

  def full?
    @board.none? {|location| location == " "}
  end

  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end

  def over?
    if won? || draw? || full?
      return true
    end
  end

  def winner
    if won?
      return @board[won?[0]]
    end
  end

  def play
    while !over?
      turn
      won?
      draw?
    end
      if won?
        puts "Congratulations " + winner + "!"
      elsif draw?
        puts "Cats Game!"
      end
  end

end

