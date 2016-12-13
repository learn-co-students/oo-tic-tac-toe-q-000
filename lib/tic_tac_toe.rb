class TicTacToe
  def initialize(board = nil)
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
    [2, 4, 6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(input, character)
    @board[input_to_index(input)] = character
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(input)
    index = input_to_index(input)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    count = 0
    @board.each do |cell|
      if cell == "X" || cell == "O"
        count += 1
      end
    end
    return count
  end

  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
        if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
          return combo unless @board[combo[0]] == " "
        end
    end
    false
  end

  def full?
    if @board.include?(" ")
      false
    else
      true
    end
  end

  def draw?
    if full? && !won?
      true
    elsif !(won? && full?) || won?
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
    if won? && @board[won?[0]] == "X"
      "X"
    elsif won? && @board[won?[0]] == "O"
      "O"
    else
      nil
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end
