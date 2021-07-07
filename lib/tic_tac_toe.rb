class TicTacToe
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  
  def initialize
    @board = Array.new(9) {" "}
  end

  def get_board_section(pos)
    @board[pos]
  end

  def display_board
    counter = 0
    2.times do
      puts " #{get_board_section(counter)} | #{get_board_section(counter+1)} | #{get_board_section(counter+2)} "
      puts "-----------"
      counter += 3
    end
    puts " #{get_board_section(counter)} | #{get_board_section(counter+1)} | #{get_board_section(counter+2)} "
  end

  def turn_count
    @board.count do |space|
      space == "X" || space == "O"
    end
  end

  def move(pos, char)
    @board[pos-1] = char
  end

  def position_taken?(pos)
    !(get_board_section(pos) == " " || get_board_section(pos) == "" || get_board_section(pos) == nil)
  end

  def valid_move?(pos)
    pos.to_i >= 1 && pos.to_i <= 9 && !position_taken?(pos.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    until valid_move?(input)
      puts "Invalid move! Please enter 1-9:"
      display_board
      input = gets.strip
    end
    move(input.to_i, current_player)
    display_board
  end

  def current_player
    turns = turn_count
    turns.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect { |index| (get_board_section(index[0]) == "X" && get_board_section(index[1]) == "X" && get_board_section(index[2]) == "X") || (get_board_section(index[0]) == "O" && get_board_section(index[1]) == "O" && get_board_section(index[2]) == "O") }
  end

  def full?
    !(@board.any? { |space| space.nil? || space == " " || space == "" })
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    won?.class == Array ? get_board_section(won?[0]) : nil
  end

  def play
    puts "Welcome to TicTacToe!"
    display_board

    while !over?
      turn
    end

    if winner != nil
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end

end