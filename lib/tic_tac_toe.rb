class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #Top row
    [3,4,5], #Middle row
    [6,7,8], #Bottom row
    [0,3,6], #Left column
    [1,4,7], #Middle column
    [2,5,8], #Right column
    [0,4,8], #Diagonal 1
    [6,4,2]  #Diagonal 2
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
    while valid_move?(input) != true
      puts "Please enter 1-9:"
      input = gets.strip
    end
    character = current_player
    move(input, character)
    display_board
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      combination = combination.all? do |character|
        @board[character] == "X"
        end ||
      combination.all? do |character|
        @board[character] == "O"
      end
      combination == true
    end
  end

  def full?
    @board.all? do |character|
      character == "X" || character == "O"
    end
  end

  def draw?
    if won? == nil && full? == true
      true
    else
      false
    end
  end

  def over?
    if full? == true || !!won? == true || draw? == true
      true
    else
      false
    end
  end

  def winner
    if won? == nil
      nil
    else
      @board[won?[0]]
    end
  end

  def play
      if !!won? == true
        puts "Congratulations #{winner}!"
      elsif draw? == true
        puts "Cats Game!"
      else
        while over? == false
          turn
          play
        end
      end
  end
end