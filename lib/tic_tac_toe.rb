class TicTacToe
  def initialize
    @board = Array.new(9, " ");
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(input, current_player)
    index = input - 1;
    @board[index] = current_player;
  end
#
  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(input)
    input = input.to_i;
    input.between?(1,9) && !position_taken?(input - 1)
  end

  def turn
    puts "Please enter 1-9:"
    @input = gets.strip.to_i
    if valid_move?(@input)
      move(@input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0;
    @board.each do |board|
      if(board != " ")
        counter += 1;
      end
    end
    return counter;
  end

  def current_player
    if(turn_count % 2 == 0)
      return "X";
    else
      return "O";
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_conbination| # [0,1,2], ...
      position_taken?(win_conbination[0]) && @board[win_conbination[0]] == @board[win_conbination[1]] && @board[win_conbination[0]] == @board[win_conbination[2]]
    end
  end

  def full?
    indexes = [0,1,2,3,4,5,6,7,8];
    indexes.all? do |index|
      position_taken?(index);
    end
  end

  def draw?
    if !won? && full?
      return true;
    else
      return false;
    end
  end

  def over?
    if won? || draw? || full?
      return true;
    else
      return false;
    end
  end

  def winner
    if won?
      winner = @board[won?[0]];
    end
    return winner;
  end

  def play
    while !over?
      turn;
    end
    if won?
      puts "Congratulations #{winner}!";
    elsif draw?
      puts "Cats Game!";
    end
  end
end
