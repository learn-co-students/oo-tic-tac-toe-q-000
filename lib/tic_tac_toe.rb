class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ") 
  end

  def display_board
    dash = "-" * 11
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts dash
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts dash
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
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

  def move(position, char="X")
    @board[position.to_i-1] = char
  end

  def position_taken?(position)
    @board[position] != " " && @board[position] != ""
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

  def turn_count
    @board.join('').scan(/[XO]/).count
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    return false if @board.all? {|x| x == " " || x.nil?}

    WIN_COMBINATIONS.each do |win_combination|
      index_1 = win_combination[0]
      index_2 = win_combination[1]
      index_3 = win_combination[2]

      pos_1 = @board[index_1]
      pos_2 = @board[index_2]
      pos_3 = @board[index_3]

      if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") || (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
        return win_combination
      else
        false
      end
    end
    false
  end

  def full?
    turn_count == 9 && !won?
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    until over?
      turn
    end

    puts "Congratulations #{winner}!" if won?
    puts "Cats Game!" if draw?
  end
end