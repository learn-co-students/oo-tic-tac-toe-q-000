class TicTacToe

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,4,8],
      [2,4,6],
      [0,3,6],
      [2,5,8],
      [1,4,7]]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else  
      puts "Cats Game!"
    end
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

  def move(location, player="X")
    @board[location-1] = player
  end

  def position_taken?(location)
    @board[location].nil? || @board[location].strip.size == 0 ? false : true
  end

  def valid_move?(position)
    position = position.to_i
    ( position > 0 && position <= @board.size && @board[position-1].strip.size == 0 )
  end

  def turn
    puts "Please enter 1-9:"
    location = gets.strip.to_i
    if valid_move? location
      move location, current_player
    else
      turn
    end
    display_board
  end

  def search_winner(player)
    won = false
    WIN_COMBINATIONS.each do |combo|
      won = combo.all? { |i| @board[i] == player }
      if won
        @winner = player
        won = combo
        break
      end
    end
    won
  end

  def won?
    won = search_winner("X") || search_winner("O")
  end

  def full?
    @board.all? { |position| position.strip.size > 0 }
  end

  def draw?
    !won? && full? ? true : false
  end

  def over?
    won? || draw? 
  end

  def winner
    #won returns an array with the winning indices [[0],[1],[4]]
    winner = won? 
    if winner
      @board[winner[0]]
    end
  end

end
