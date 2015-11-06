class TicTacToe
  def initialize (board = nil)
    @board = board || [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end 

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7].
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def display_board
    puts " {@board[0]} | {@board[1]} | {@board[2]} "
    puts "-----------"
    puts " {@board[3]} | {@board[4]} | {@board[5]} "
    puts "-----------"
    puts " {@board[6]} | {@board[7]} | {@board[8]} "
  end 

  def move(input, character = "X")
    @board[input.to_i-1 = character]
    return @board 
  end 

  def position_taken?(input)
    if @board[input] == " " || @board[input] == "" || @board[input] == nil
      return false
    else
      return true
    end
  end 

  def valid_move?(input)
    if input.to_i.between?(1,9)
      if !position_taken?(input.to_i-1)
        true
      end
    end 
  end 

  def turn
    puts "Please enter 1-9:"
    input gets.strip
    valid_move(input)
    if valid_move?(input) == true
        move(input, character)
        display_board
    else 
        turn()
    end 
  end 

  def turn_count
    turns_played = 0
    @board.each do |cell|
      turns_played += 1 is cell == "X" || cell == "O"
    end
    turns_played
  end 

  def current_player 
    turn_count % 2 == 0 ? "X" : "O"
  end 

  def won?
    WIN_COMBINATIONS.find do |win|
      @board[win[0]] == @board[win[1]] &&
      @board[win[1]] == @board[win[2]] &&
      position_taken?(win[0])
    end 
  end 

  def full?()
    @board.all?{|i| i == "X" || i== "O"}
  end 

  def draw?
    full? && !won?
  end 

  def over?
    won? || draw? || full?
  end 

  def winner
    if winning_combo = won?
      @board[winning_combo.first]
    end 
  end 

  def play
    until over?
      turn()
    end 
    if won?
      puts "Congratulations, you have won!"
    elsif draw?()
      puts "Cats game"
    end 
  end 
end