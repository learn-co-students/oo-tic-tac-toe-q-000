class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count.even? ? "X" : "O"
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

  def move(location, token)
    @board[location.to_i - 1] = token
  end

  def position_taken?(location)
    !(@board[location] == " " || @board[location].nil?)
  end

  def valid_move?(position)
    !position_taken?(position.to_i - 1) && position.to_i.between?(1,9)
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

  def won?
    WIN_COMBINATIONS.each do |combination|
      if @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X" || @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"
        return combination 
      end
    end
    return nil
  end

  def full?
    @board.all? do |position|
      !(position == " " || position == "" || position == nil)
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      won?.each do |position|
        if @board[position] == "X"
          return "X"
        elsif @board[position] == "O"
          return "O"
        end
      end
    end
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
  ]

  def play
    display_board
    until over?
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end