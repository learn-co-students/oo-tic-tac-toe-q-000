class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end  

  WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  def move(input, character = "X")
    @board[(input.to_i) - 1] = character
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    else
      true 
    end  
  end  

  def valid_move?(input)
    input.to_i.between?(1,9) && !position_taken?(input.to_i-1)
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
    count = 0
    @board.each do |n|
      if n == "O" || n == "X"
        count += 1
      end
    end
    count    
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end  

  def won?
    WIN_COMBINATIONS.find do |combination|
      @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X" ||
      @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"
    end
   end

  def full?
    @board.all? {|value| value == "X" || value == "O"} 
  end  

  def draw?
    !won? && full?  
  end  

  def over?
    won? || draw?|| full?
  end

  def winner
    if won?
      @board[won?.first]
    else
      nil
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
