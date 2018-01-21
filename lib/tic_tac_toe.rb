class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end

  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def move(location, current_player)
    @board[location.to_i-1] = current_player
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
      if valid_move?(input)
        move(input, current_player)
      else
      turn
      end
    display_board
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      (@board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X") || (@board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O")
    end
  end

  def full?
    @board.all? {|position| position == "X" || position == "O"}
  end 

  def draw?
    if won?
      false
    elsif !full?
      false
    else
      true
    end
  end

  def turn_count
    turns = 0
    @board.each do |position|
      if position == "X" || position == "O"
        turns += 1
      end
    end
    turns
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def over?
    if won? || full? || draw?
      true
    end
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    if won?
      if winner == "X"
        puts "Congratulations X!"
      else
        puts "Congratulations O!"
      end
    elsif draw?
      puts "Cats Game!"
    end
  end

end