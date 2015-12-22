class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2],
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(input, character = "X")
    input -= 1
    @board[input] = character
  end

  def position_taken?(input)
    if @board[input] == "X" || @board[input] == "O"
      true
    else
      false
    end
  end

  def valid_move?(input)
    if input.is_a? String
      input = input.to_i
    end
    if input.between?(1,9) && !position_taken?(input-1)
       true
    else
       false
    end
  end

  def turn
    puts "Please input a move 1-9:"
    input = gets.strip
    if input.is_a? String
      input = input.to_i
    end
    if valid_move?(input)
      move(input, current_player)
    else 
      turn
    end
    display_board
  end

  def turn_count
    number_of_turns = 0
    @board.each do |i|
      if i != " "
        number_of_turns += 1
      end
    end
    return number_of_turns
  end

  def current_player
    number_of_turns = turn_count
    if number_of_turns % 2 == 0
      return "X"
    else
      return "O"
    end    
  end

  def won?
    WIN_COMBINATIONS.each do |i|
      if (@board[i[0]] == "X" && @board[i[1]] == "X" && @board[i[2]] == "X") || (@board[i[0]] == "O" && @board[i[1]] == "O" && @board[i[2]] == "O")
        return i
      end
    end
    false
  end

  def full?
    none_blank = @board.none? do |i|
      i == " "
    end
  end

  def draw?
    if full? && !won?
      true
    else
      false
    end
  end 

  def over?
    if draw? || won?
      true
    else
     false
    end
  end

  def winner
    if won?
      winner = @board[won?[0]]
    end
  end 

  def play
    game_is_over = over?
    until game_is_over
      turn
      game_is_over = over?
    end
    if won?
      puts "Congratulations " + winner + "!"
    elsif draw?
      puts "Cats Game!"
    end
  end 

end