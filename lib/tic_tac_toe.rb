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

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, player = "X")
    index = index.to_i
    def update_board_at_with(index, player)
      @board[index - 1] = player
    end
      update_board_at_with(index, player)
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    else @board[index] == "X" || @board[index] == "O"
      return true
    end
  end

  def valid_move?(index)
    index = index.to_i
    index = index - 1
    if index.between?(0,8) && !position_taken?(index)
    return true
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input
    if valid_move?(index)
       move(index, current_player)
       return display_board
    else
      turn
    end
  end

  def turn_count
    @board.each do |count|
      return @board.count { |x| x != " "}
    end
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else turn_count % 2 == 1
      return "O"
    end
  end

  def won?
    if WIN_COMBINATIONS.each do |combo|

      combo_index_1 = combo[0]
      combo_index_2 = combo[1]
      combo_index_3 = combo[2]

      win_position_1 = @board[combo_index_1]
      win_position_2 = @board[combo_index_2]
      win_position_3 = @board[combo_index_3]

      if win_position_1 == "X" && win_position_2 == "X" && win_position_3 == "X"
        return combo
      elsif win_position_1 == "O" && win_position_2 == "O" && win_position_3 == "O"
        return combo
      end
    end
    else
      return false
    end
  end

  def full?
    if @board.any? { |i| i == " " }
      return false
    elsif @board.count{|i| i == 5}
      return true
    end
  end

  def draw?
    if full? == true && !won?
      return true
    else
      return false
    end
  end

  def over?
    if draw? == true || won?
      return true
    else
      return false
    end
  end

  def winner
     if win_combo = won?
       @board[win_combo.first]
     end
   end

   def play
     while !over?
           turn   
       end
         if over?
           puts "Congratulations #{winner}!"
         end
         if draw?
           puts "Cats Game!"
         end
     end

end
