class TicTacToe
  def initialize (board=nil)
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
      [0,1,2], # Top row
      [3,4,5],  # Middle row
      [6,7,8],  # Bottom row

      [0,3,6],  # First column
      [1,4,7],  # Second column
      [2,5,8],  # Third column

      [0,4,8],  # First Diagonal
      [6,4,2]  # Second Diagonal
    ]

  def move(position,char="X")
    @board[position.to_i-1] = char
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input,current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    @board.any?{|cell| cell == " "}
    WIN_COMBINATIONS.each do |combination|
      if position_taken?(combination[0]) && position_taken?(combination[1]) && position_taken?(combination[2])
        if @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]] && @board[combination[0]] == @board[combination[2]]
          return combination
        end
      end
    end
    return false
  end

  def full?
  if won? == false && !@board.any?{|cell| cell == " "}
    return true
  else
    return false
  end
end

  def draw?
    if full? == true && won? == false
      puts "Cats Game!"
      return true
    else
      false
    end
  end

  def over?
    if draw?
      true
    elsif won?
      true
    else
      false
    end
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    turn_counter=0
    while turn_counter < 9
      if won?
        puts "Congratulations #{winner}!"
        break
      end
      if over?
        break
      end
      turn
      turn_counter += 1
    end
  end




end