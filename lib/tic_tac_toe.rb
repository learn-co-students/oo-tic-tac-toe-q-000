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

  WIN_COMBINATIONS = [
  [0, 1, 2], 
  [3, 4, 5], 
  [6, 7, 8], 
  [0, 3, 6], 
  [1, 4, 7], 
  [2, 5, 8], 
  [6, 4, 2], 
  [0, 4, 8]  
  ]

  def move(location, current_player = "X")
    @board[location.to_i-1] = current_player
  end

  def position_taken?(location)
  !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
    current_player
    move(input, current_player)
    else
    turn
    end
    display_board
  end

  def won?
    match = WIN_COMBINATIONS.select do |e|
      e.all? {|i| @board[i.to_i] == "X"} || e.all? {|i| @board[i.to_i] == "O"}
    end
    if match == []  
      match = nil
    else
      match = match[0]
    end
  end

  def full?
    if @board.all? { |cell| cell == "X" || cell == "O"}
      true
    else
      false
    end
  end

  def draw?
    if !won? && full?
      true
    else 
      false
    end
  end

  def over?
    if won? || full? || draw?
      true
    else
      false
    end
  end

  def winner
    if over? == true && won? != nil
      match = WIN_COMBINATIONS.select do |e|
      e.all? {|i| @board[i.to_i] == "X"} || e.all? {|i| @board[i.to_i] == "O"}
      end
      who_won = @board[match[0][0]]
      who_won = who_won.to_s
    else
      who_won = nil
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