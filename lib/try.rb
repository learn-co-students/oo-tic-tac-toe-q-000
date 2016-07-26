class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def move(input=@input, token=@token)
    @index=input-1
    @board[@index]=token
  end
  def position_taken?(input=@input, board=@board)
    index=input
    if  board[index]=="X" || board[index]=="O"
      true
    else
      false
    end
  end

  def valid_move?(inputa=@input, board=@board)
    input=inputa.to_i-1
    @valid_move=false
    if (!position_taken?(input, board)) && ([0,1,2,3,4,5,6,7,8].include? input)
      @valid_move=true
      true
    end
  end
  def turn
    @input=nil
    display_board
    @token="X"
    until  ["1","2","3","4","5","6","7","8","9"].include? @input
      puts "What is your move? #{@token}"
      @input=gets.strip
    end
    valid_move?
    if @valid_move
      @input=@input.to_i
      move
    else
      puts "invalid"
    end
  end
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  def won?
    WIN_COMBINATIONS.any? do |winco|
      if @board[winco[0]]==@board[winco[1]] && @board[winco[1]]==@board[winco[2]] && @board[winco[2]]!=" " && @board[winco[2]]!=""
        true
      else
        false
      end
    end
  end
  def full?
    [0,1,2,3,4,5,6,7,8].all? do |spot|
      @board[spot]=="X" || @board[spot]=="O"
      end
    end
  def draw?
    if won?!=true  && full?
      true
    else
      false
    end
  end
  def over?
    over=nil
    if full? || won?
      over=true
    end
  end
  def winner
    winner=nil
    WIN_COMBINATIONS.each do |winco|
      if @board[winco[0]]==@board[winco[1]] && @board[winco[1]]==@board[winco[2]] && @board[winco[2]]!=" " && @board[winco[2]]!=""
        @winner=@board[winco[0]]
      end
    end
    @winner
  end
  def play
    turn
    winner
    if won? && @winner=="X"
      puts "Congratulations X!"
    elsif won? && @winner=="O"
      puts "Congragulations O!"
    elsif draw?
      puts "Cats Game!"
    else
       puts "no winner yet"
       play
     end
     end
   end
