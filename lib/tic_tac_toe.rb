
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [  [0,1,2],  [3,4,5],  [6,7,8],  [0,3,6],  [1,4,7],  [2,5,8],  [0,4,8],  [6,4,2]  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(input = 1,player = "X")
    @board[input.to_i - 1] = player
  end

  def position_taken?(position)
      taken = nil
    if @board[position] == " " || @board[position] == "" || @board[position] == nil
      taken = false
    elsif @board[position] == "X" || @board[position] == "O"
      taken = true
     end
   taken
   end

  def valid_move?(position)
    taken1 = nil
    if position.to_i.between?(1,9)
      if position_taken?(position.to_i-1)
        taken1 = false
    else
        taken1 = true
      end
    end
    taken1
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(position)
      current_player
      move(position, current_player)
    else
      turn
    end
    display_board
  end

  def current_player
    turn_count
      if turn_count % 2 == 0
        player = "X"
      else
       player = "O"
      end
     player
  end

  def turn_count
    counter = 0
    @board.each do |moved|
      if moved == "X" || moved == "O"
        counter += 1
      end
   end
   counter
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
    end
  end

  def full?
    @board.all? do |full|
      full == "X" || full == "O"
    end
  end

  def draw?
    !won? && full?
    if full? == true && won?.nil?
      puts "Cats Game!"
      true
    elsif full? == true && won? == true
      false
    elsif full? == false && won? == false
      false
    end
  end

  def over?
    if draw? == true
      true
    elsif !won?.nil?
      true
    elsif full? == false
      false
    end
  end

  def winner
    if !won?.nil?
      puts "Congratulations #{@board[won?[0]]}!"
     @board[won?[0]]
    end
  end

def play
  until (over? == true) do
      turn
  end
      winner
end

end
