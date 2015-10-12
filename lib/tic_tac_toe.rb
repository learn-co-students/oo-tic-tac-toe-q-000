class TicTacToe

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, current_player = "X")
    @board[location.to_i-1] = current_player
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      x = current_player
      move(input, x)
    else
      turn
    end
    display_board
  end

  def turn_count
    count = 0
    @board.each {|x| 
      if (x == "X") || (x == "O") 
        count +=1 
      end
    }
    count
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      win = combo.all? do |position|
        position_taken?(position) && (@board[position] == @board[combo[0]])
      end
      if win
        return combo
      end
    end
    return false
  end

  def full?
    full = @board.none? {|x| x == " " }
  end

  def draw?
    draw = false
      if full?
        draw = true
      end
      if won?
        draw = false
      end
    draw
  end

  def over?
    over = false
      if draw? || won? 
        over = true
      end
    over
  end

  def winner
    winner = nil
      if won?
        winner = @board[won?[0]]
      end
    winner
  end

  def play
    while over? == false
      turn
    end
    if over? == true
      if won?
        puts "Congratulations #{winner}!"
      else
        puts "Cats Game!"
      end
    end
  end

end