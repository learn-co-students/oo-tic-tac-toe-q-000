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

  def move(position, player)
    @board[position.to_i - 1] = player
  end

  def position_taken?(position)
    if @board[position.to_i] == " "
      return false
    else
      return true
    end
  end

  def valid_move?(position)
    if position_taken?(position.to_i - 1) || !position.to_i.between?(1,10)
      puts "invalid"
      return false
    else
      return true
    end
  end

  def turn
    puts "Choose a space 1-#{@board.length}"
    position = gets.strip
    if valid_move?(position)
      move(position, current_player)
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      
      position_1 = @board[win_combination[0]]
      position_2 = @board[win_combination[1]]
      position_3 = @board[win_combination[2]]

      if position_1 != " " && position_1 == position_2 && position_1 == position_3
        return win_combination
      end
    end
    return false
  end

  def full?
    if @board.any?{ |i| i == " "}
      return false
    else
      return true
    end
  end

  def draw?
    if !full? || won?
      return false
    else
      return true
    end
  end

  def over?
    if full?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      player = won?
      return @board[player[0]]
    else
      return nil
    end
  end

  def play
    until over? || won? || draw?
      puts "\n"
      display_board
      puts "\n"
      turn
    end
    puts "\n"
    display_board
    puts "\n"
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cats Game!"
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
    [6,4,2]
  ]
end