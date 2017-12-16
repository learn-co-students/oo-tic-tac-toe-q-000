class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS=[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
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

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token="X")
    @board[index]=token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if position_taken?(index) == false && index.between?(0, 8)
      true
    end
  end

  def turn
    puts "Please enter 1-9:"
    input=gets.strip
    index=input_to_index(input)
    until valid_move?(index)==true
      puts "Please enter 1-9:"
      input=gets.strip
      index=input_to_index(input)
    end
    token=current_player
    move(index,token)
    display_board
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      if
        win_combination.all? do |win_index|
          @board[win_index]=="X"
        end
        true
      elsif
        win_combination.all? do |win_index|
          @board[win_index]=="O"
        end
        true
      else
        nil
      end
    end
  end

  def full?
    @board.all? do |index|
      index=="X"||index=="O"
    end
  end

  def draw?
    if full? == true && won? == nil
      true
    end
  end

  def over?
    if won?!=nil || full? == true
      true
    else
      false
    end
  end

  def winner
    if won?!=nil
      @board[won?.detect {|index| @board[index]=="X" || @board[index]=="O"}]
    else
      nil
    end
  end

  def play
    until over? == true || won? != nil || draw? == true
      turn
    end
    if won?!=nil
      puts "Congratulations #{winner}!"
    elsif draw? == true
      puts "Cat's Game!"
    end
    won?
  end

end
