class TicTacToe

  def initialize(board=[" "," "," "," "," "," "," "," "," "])
    @board = board
  end

  def board
    @board
  end

  def board=(board)
    @board = board
  end

  def display_board
    puts " #{board[0]} ""|"" #{board[1]} ""|"" #{board[2]} "
    puts "-----------"
    puts " #{board[3]} ""|"" #{board[4]} ""|"" #{board[5]} "
    puts "-----------"
    puts " #{board[6]} ""|"" #{board[7]} ""|"" #{board[8]} "
  end

  WIN_COMBINATIONS = [[0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #left column
    [1, 4, 7], #mid column
    [2, 5, 8], #right column
    [0, 4, 8], #diagonal down
    [6, 4, 2]] #diagonal up

  def play
    until over?
      turn
      turn_count
      current_player
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def move(position, value="X")
    board[position.to_i - 1] = value
  end


  def position_taken?(position)
    !(board[position].nil? || board[position] == " ")
  end


  def valid_move?(position)
    position = position.to_i
    if !(position.between?(1, 9)) || position_taken?(position - 1)
      return false
    else
      return true
    end
  end


  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    while !(valid_move?(input))
      puts "invalid"
      puts "Please enter 1-9:"
      input = gets.strip
    end
    move(input, current_player)
    display_board
  end

  def turn_count
    count = 0
    board.each do |pos|
      if pos == "X" || pos == "O" then
        count += 1
      end
     end
   return count
  end

  def current_player
    if turn_count % 2 == 0
      current_player = "X"
    else
      current_player = "O"
    end
    return current_player
  end

  def won?
      count = 0
      WIN_COMBINATIONS.each do |combi|
      if (board[combi[0]] == "X" && board[combi[1]] == "X" && board[combi[2]] == "X" ||
      board[combi[0]] == "O" && board[combi[1]] == "O" && board[combi[2]] == "O")
        return combi
      else
        count += 1
        if count == 8
          return false
        end
      end
    end
  end

  def full?
    board.each do |pos|
      if pos != " "
        next
        return true
      else
        return false
      end
    end
  end

  def draw?
    if !(won?) && full?
      return true
    else
      return false
    end
  end

  def over?
    if full? || draw? || won?
      return true
    else
      return false
    end
  end

    def winner
    if won? == false
      return nil
    elsif board[won?[0]] == "X"
      return "X"
    elsif board[won?[0]] == "O"
      return "O"
    end
  end
end

