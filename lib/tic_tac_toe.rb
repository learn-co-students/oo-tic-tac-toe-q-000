class TicTacToe
  def initialize
    @board=[" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

  def move(location, current_player = "X")
    @board[location.to_i-1] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input,current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    count=0
    @board.each do |element|
      if (element=="X"||element=="O")
        count+=1
      end
    end
    return count
  end

  def current_player
    if(turn_count % 2==0)
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |winner|
      if(winner.all? {|cell| @board[cell]=="X"})
        return winner
      end
      if(winner.all? {|cell| @board[cell]=="O"})
        return winner
      end
    end
    return nil
  end

  def full?
    @board.all? do |cell|
      cell=="X"||cell=="O"
    end
  end

  def draw?
    if(won?)
      return false
    elsif(full?)
      return true
    else
      return false
    end
  end

  def over?
    return won?||full?||draw?
  end

  def winner
    if(!won?)
      return nil
    else
      return @board[won?[0]]
    end
  end

  def play
    while(!over?)
      turn
    end
    if(winner=="X")
      puts"Congratulations X!"
    elsif(winner=="O")
      puts"Congratulations O!"
    else
      puts"Cats Game!"
    end
  end

end