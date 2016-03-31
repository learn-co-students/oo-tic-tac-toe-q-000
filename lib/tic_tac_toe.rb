class TicTacToe
  def initialize(board = nil)
	  @board = board || Array.new(9, " ")
	end

	def current_player
	  turn_count % 2 == 0 ? "X" : "O"
  end

	def turn_count
	  @board.count{|token| token == "X" || token == "O"}
  end

  def move(position, token)
   token = current_player
   @board[position - 1] = token
  end

  def position_taken?(position)
   !(@board[position].nil? || @board[position] == " ")
  end

  def valid_move?(position)
   position = position.to_i - 1
   if !position_taken?(position) && position.between?(0, 8)
     true
   end
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
	  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
	end

   def turn()
    puts "Please enter 1-9:"
    input = gets.strip
    position = input.to_i
    if valid_move?(position) == true
      turn_count()
      move(position, current_player())
     else
      until valid_move?(position) == true
        puts "Please enter a valid number"
        puts "Please enter 1-9:"
        input = gets.strip
        position = input.to_i
        valid_move?(position)
      end
      move(position, current_player())
    end
    display_board()
  end

  def won?()
    WIN_COMBINATIONS.each do |combo|
      array = []
      combo.each do |element|
        if position_taken?(element)
          array << @board[element]
        end
      end
      if array == ["X", "X", "X"] || array == ["O", "O", "O"]
        return combo
        end
      end
   false
  end

  def full?()
    @board.all? do |position|
      position != " "
    end
  end

  def draw?()
    full?() && !won?()
  end

  def over?()
    won?() || draw?()
  end

  def winner()
    if won?() != false
      win_combo = won?()
      winner = ""
      winner = @board[win_combo[0]]
      return winner
    end
  end

  def play()
    puts = "Welcome to Tic Tac Toe!"
    until over?() #until the game is over
      turn() #take turns
    end

     if won?()#if the game was won
         puts "Congratulations #{winner()}!"#  congratulate the winner
       elsif draw?()#else if the game was a draw
         puts "Cats Game!"#  tell the players it has been a draw
     end
  end
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]
end
#rspec spec/01_tic_tac_toe_spec.rb
#rspec spec/02_play_spec.rb
#rspec spec/03_cli_spec.rb