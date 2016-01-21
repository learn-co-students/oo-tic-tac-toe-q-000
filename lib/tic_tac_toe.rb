class TicTacToe
  def initialize(board=Array.new(9, " "))
    @board=board
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,4,8], #l-top r-bottom
    [6,4,2], #r-top l-bottom
    [0,3,6], #left col
    [1,4,7], #mid col
    [2,5,8], #right col
  ]

def display_board
    puts (" #{@board[0]} | #{@board[1]} | #{@board[2]} ")
    puts ("-----------")
    puts (" #{@board[3]} | #{@board[4]} | #{@board[5]} ")
    puts ("-----------")
    puts (" #{@board[6]} | #{@board[7]} | #{@board[8]} ")
end

def display_board=(new_board)
    @board=new_board
    display_board()
end

  def move (location,token="X")
    @token=token
    @location=location
    @board[location.to_i-1]=@token
  end

  def position_taken?(position)
    @position=position
    if @board[@position]=="X"||@board[@position]=="O"
      true
    else
      false
    end
  end

  def valid_move?(position)
    @position=position.to_i
    if ((0<@position)&&(@position<10))&&!position_taken?(@position-1)
      true
    else
      false
    end
  end

  def turn()
    puts "Please enter a move, 1-9."
    input=gets.strip
    if !valid_move?(input)
      turn()
    else
      move(input,current_player)
      display_board()
    end
  end

  def turn_count()
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player()
    turn_count() % 2 == 0 ? "X" : "O"
  end
  
  def won?()
    WIN_COMBINATIONS.each do |wincombination|
      win_index_1 = wincombination[0]
      win_index_2 = wincombination[1]
      win_index_3 = wincombination[2]

      position_1=@board[win_index_1]
      position_2=@board[win_index_2]
      position_3=@board[win_index_3]

      if (position_1=="X" && position_2=="X" && position_3=="X")||(position_1=="O" && position_2=="O" && position_3=="O")
         return [win_index_1,win_index_2,win_index_3]
      end
    end
    false
  end

  def full?()
    @board.each do |cell|
      if (cell==" ")
        return false
      end
    end
    true
  end

  def over?()
    if (draw?()||won?() )
      true
    else
      false
    end
  end

  def draw?()
    if (full?()&&!won?())
      true
    else
      false
    end
  end

  def winner()
    if draw?()
      nil
    elsif won?()
      @win=won?()
      @board[@win[0]]
    end
  end

  def play()
    until (over?())
      turn()
    end
    if draw?()
      puts "Cats Game!"
    elsif won?()
      puts "Congratulations #{winner()}!"
    end
  end
end