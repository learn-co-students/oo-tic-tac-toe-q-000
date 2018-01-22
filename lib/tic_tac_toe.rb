class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9," ")
    #display_board
    #play
  end

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

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8], #horizontals
  [0,3,6],
  [1,4,7],
  [2,5,8], #verticals
  [0,4,8],
  [6,4,2], #diags
  ]

  def move(location, player= "X")
    @board[location.to_i-1] = current_player
  end

  def position_taken?(position)
    !(@board[position].nil? || @board[position] == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
      if valid_move?(input)
        move(input)
      else
        turn
      end
      display_board
  end

  def position_taken_o?(location)
    !(@board[location].nil? || @board[location] == " " || @board[location] == "X")
  end

  def position_taken_x?(location)
    !(@board[location].nil? || @board[location] == " " || @board[location] == "O")
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      if combo.all? do |i|
        position_taken_x?(i)
        end
        return combo
        break
      elsif combo.all? do |i|
        position_taken_o?(i)
        end
        return combo
        break
      else
        false
      end
    end
  end

  def full?
    #(0..8).none?{|i| position_taken?(board,i)}
    (0..8).all?{|i| position_taken?(i)}
  end

  def draw?
    full? && !won?
  end

  def over?
    full? || draw?|| won?
  end

  def winner
    WIN_COMBINATIONS.any? do |combo|
      if combo.all? do |i|
        position_taken_x?(i)
        end
        puts "Congratulations X!"
        return "X"
        break
      elsif combo.all? do |i|
        position_taken_o?(i)
        end
        puts "Congratulations O!"
        return "O"
        break
      else
      end
    end
    puts "Cats Game!"
  end

  def play
    until over?
      turn
    end
    winner
  end

end

