class TicTacToe

  def initialize(board = [" "," "," "," "," "," "," "," "," "])
    @board = board
  end

  WIN_COMBINATIONS = [  [0,1,2],  [0,3,6],  [0,4,8],  [1,4,7],  [2,5,8],  [6,4,2],  [3,4,5],  [6,7,8] ]

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    post = position.to_i-1
    board_ = @board[post]
    valid = true
    if post < 0 || post > 8 || position_taken?(post)
        valid = false
    end
    valid
  end

  def move(position, marker)
    post = position.to_i-1
    valid = valid_move?(position)
    if valid
      @board[post] = marker
    end
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    valid = valid_move?(position)
    if !valid
      turn
    else
      move(position,current_player)
      display_board
    end
  end

  def turn_count
    val = 0
    @board.each do |cell|
      if cell == "X" || cell == "O"
        val = val + 1
      end
    end
    val
  end

  def current_player
    val = turn_count
    if val % 2 == 0
      "X"
      else
      "O"
    end
  end

  def won?
    win = false
    counter = 0
    while counter < 8 && win == false
      index = WIN_COMBINATIONS[counter]
      marker = @board[index[0]]
      if position_taken?(index[0])
        if @board[index[0]] == marker && @board[index[1]] == marker && @board[index[2]] == marker
          win = index
        end
      end
      counter = counter + 1
    end
    win
  end

  def full?
    index = 0
    cont = true
    while index < 9 && cont == true
      cont  = position_taken?(index)
      index = index + 1
    end
    cont
  end

  def draw?
    !won? && full?
  end

  def over?
    val = false
    if won? == false
      if draw?
        val = true
      end
    else
      val = true
    end
    val
  end

  def winner
    if over? && !draw?
      @board[won?[0]]
    end
  end

  def play
    until over?
      turn
      draw?
    end
    if draw?
      puts "Cats Game!"
    elsif won? != false
      puts puts "Congratulations #{winner}!"
    end
  end
end