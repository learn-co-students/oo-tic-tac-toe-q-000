class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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

  def move(input, current_player)
    if(valid_move?(input))
      @board[input_to_index(input)] = current_player
    end
  end

  def position_taken?(index)
    !(@board[index] == " ")
  end

  def input_to_index(user_input)
    user_input = user_input.to_i
    if (user_input.between?(1,9))
      index = user_input - 1
    else
      return false
    end
  end

  def valid_move?(input)
    input_to_index(input).is_a?(Integer) && !position_taken?(input_to_index(input))
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
      if(input_to_index(input))
        move(input, current_player)
        display_board
      else
        turn
      end
  end

  def turn_count
    @board.count{ |token| token == "X" || token == "O" }
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def confirm_token_match(token = "X")
    WIN_COMBINATIONS.detect do |win_combos|
      win_combos.all? do |check_pos|
        position_taken?(check_pos) == true && @board[check_pos] == token
      end
    end
  end

  def won?
    winning_array = confirm_token_match()
    winning_array.is_a?( Array ) ? winning_array : winning_array = confirm_token_match("O")
    winning_array.is_a?( Array ) ? winning_array : nil

  end

  def full?
    @board.all? { |element| element == "X" || element == "O" }
  end

  def draw?
    !(won?) && full?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if(won?)
      winning_input = confirm_token_match
      winning_input.is_a?( Array ) ? "X" : "O"
    end
  end

  def play
    if (won?)
      puts "Congratulations #{winner}!"
    end
    if(draw?)
      puts "Cats Game!"
    end
    until(over?)
      turn
      if (won?)
        puts "Congratulations #{winner}!"
      end
      if(draw?)
        puts "Cats Game!"
      end
    end
  end

end
