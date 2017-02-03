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

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player = "X")
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0 ,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def player_turn
    turn_count(@board) % 2 == 0 ? "X" : "O"
  end

  def current_player
    if turn_count.odd?
      "O"
    else
      "X"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      if win_combination.all? do |win_index|
        @board[win_index] == "X"
      end
        return win_combination
      elsif win_combination.all? do |win_index|
        @board[win_index] == "O"
      end
        return win_combination
      end
    end
    return false
    @board.any? do |position|
      position == "X" || position == "O"
    end
  end

  def full?
    !(@board.include?(" "))
  end

  def draw?
    !(won?) && full?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if won?
      win_combination = won?
        if @board[win_combination[0]] == "X"
          return "X"
        else
          return "O"
        end
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
