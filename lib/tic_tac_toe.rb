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
    [2,4,6]
  ]


  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def position_taken?(position)
    (@board[position] == "X" || @board[position] == "O")
  end

  def valid_move?(position)
    (position.to_i.between?(1,9) && !position_taken?(position.to_i-1))
  end

  def move(position, mark)
    @board[position.to_i-1] = mark
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if (@board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]] && @board[combo[0]] != " " && @board[combo[0]] != "" && !@board[combo[0]].nil?)
        return combo
        break
      end
    end
    return false
  end

  def winner
    winner = won?
    if winner != false
      return @board[winner[0]]
    else
      return nil
    end
  end

  def full?
    if !(won?)
      @board.each do |position|
        if (position != "O" && position != "X" )
          return false
        end
      end
    end
    return true
  end

  def draw?
    if (won? || !full?)
      return false
    elsif (!won? && full?)
      return true
    end
  end

  def over?
    if won? || full? || draw?
      return true
    else
      return false
    end
  end

  def turn
    display_board
    puts "Please enter 1-9:"
    position = gets.strip()
    valid = false
    while valid == false
      if valid_move?(position)
        move(position, current_player)
        valid = true
      else
        puts "Invalid Move. Please enter 1-9:"
        position = gets.strip()
      end
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
    else
      puts "You broke me :("
    end
  end

end
