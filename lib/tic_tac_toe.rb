class TicTacToe
  attr_accessor :board
  def initialize
    @board = Array.new(9, " ")
  end
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6],
                      [1,4,7], [2,5,8], [0,4,8], [6,4,2]
                     ]

  def display_board
    puts " #{board[0]} | #{@board[1]} | #{@board[2]} "
    puts "----------- "
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "----------- "
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, player = "X")
    @board[location.to_i - 1] = player
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    input = position.to_i - 1
    input.between?(0, 8) && !position_taken?(input)
  end

  def turn
    puts "Please enter 1-9: "
    input = gets.chomp
    if valid_move?(input)
      move(input, current_player)
    else
      puts "Sorry. Invalid move. Please try again. "
      turn
    end
    display_board
  end

  def turn_count
    count = 0
    @board.each do |b|
      count += 1 if b == "X" || b == "O"
    end
    count
  end

  def current_player
    turn_count.even? ? player = "X" : player = "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      win_combo.all? {|position| @board[position] == "X"} ||
        win_combo.all? {|position| @board[position] == "O"}
    end
  end

  def full?
    @board.none? {|position| position == " "}
  end

  def draw?
    !won? && full?
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
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end # end of class TicTacToe

