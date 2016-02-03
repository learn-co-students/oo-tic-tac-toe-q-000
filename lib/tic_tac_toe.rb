class TicTacToe

  def initialize(board=nil)
    @board = board || Array.new(9," ")
    WIN_COMBINATIONS
  end

  def play
    puts "Welcome to OO TicTacToe!"
    display_board
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    end
    draw?
    if draw?
      puts "Cats Game!"
    end
  end

  # Helper Methods
  def position_taken?(location)
    return !(@board[location-1] == " ")
  end

  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [[0,1,2],
                      [3,4,5],
                      [6,7,8],
                      [0,3,6],
                      [1,4,7],
                      [2,5,8],
                      [0,4,8],
                      [6,4,2]]


  #WON?: true/false if winner
  def won?
    WIN_COMBINATIONS.each do  |triple|
      if(winning?(triple))
        return triple
      end
    end
    return false
  end

  #WINNING? true/false if board, triplet make winner
  def winning?(triplet)
    win = triplet.all? {|spot| @board[spot]=="X"}
    if win
      return win
    end
    win = triplet.all? {|spot| @board[spot]=="O"}
    if win
      return win
    end
    return false
  end

  #FULL?: true/false if board is full
  def full?
    result = @board.none? {|mark| mark==" "}
    return result
  end

  #DRAW?: true/false if game is tie
  #this function is redundant.  #WON? could easily have this functionality
  def draw?
    if (!won?) && (full?)
      return true
    end
    return false
  end

  #OVER?: true/false if game is over
  def over?
    if(!!won?)
      return true
    end
    if(draw?)
      return true
    end
    return false
  end

  #WINNER: return "X" or "O" for winner
  def winner
    triplet = won?
    if !!triplet
      return @board[triplet[0]]
    end
    return nil
  end

  # code your #valid_move? method here
  def valid_move?(position)
    if !position.is_a?(Integer)
      position = position.to_i
    end
    if(position>=1 && position<=@board.length && !position_taken?(position))
      return true
    end
    return false
  end

  # Define display_board that accepts a board and prints
  # out the current state.
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  #TURN takes 1 turn
  def turn
    while true
      puts "Please enter 1-9:"
      answer = gets.chomp
      if(valid_move?(answer))
         move(answer)
         display_board
         return
      end
    end
  end

  # code your move method here!
  def move(position, player=current_player)
    position = position.to_i
    @board[position-1]=player
  end

  ##TURN_COUNT to count turns in during an in-progress game
  def turn_count
    turns = 0
    @board.each do |spot|
      if spot=="X" || spot=="O"
        turns += 1
      end
    end
    return turns
  end

  ##CURRENT_PLAYER to determine who's turn it is in an in-progress game
  def current_player
    return turn_count%2==0 ? "X" : "O"
  end
end
