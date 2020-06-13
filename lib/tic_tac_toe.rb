class TicTacToe
  
  def initialize(board=nil)
    @board = board || Array.new(9, " ")
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

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(pos, mark="X")
    @board[pos.to_i-1] = mark
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
    until valid_move?(input)
      puts "Please enter 1-9:"
      input = gets.strip
    end
    move(input, current_player)
    display_board
  end

  def turn_count
    @board.count {|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    
    WIN_COMBINATIONS.each do |combo|
      board_check = []
      board_check << @board[combo[0]]
      board_check << @board[combo[1]]
      board_check << @board[combo[2]]

      if board_check.all? {|pos| pos == "X"}
        return combo
      elsif board_check.all? {|pos| pos == "O"}
        return combo
      end

    end

    false
  end

  def full?
    turn_count == 9 ? true : false
  end

  def draw?
    full? && !won? ? true : false
  end

  def over?
    draw? || won? ? true : false
  end

  def winner
    if win_combo = won?
      @board[win_combo[0]]
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
    else
      puts "Cats Game!"
    end
  end
end