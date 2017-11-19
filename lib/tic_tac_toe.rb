WIN_COMBINATIONS=
  [ [0,1,2] ,
  [3,4,5] ,
  [6,7,8] ,
  [0,3,6] ,
  [1,4,7] ,
  [2,5,8] ,
  [0,4,8] ,
  [6,4,2]   ]

class TicTacToe
    def initialize
      @board = [" "," "," "," "," "," "," "," "," "]
    end
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    def turn_count
      turncount = @board.select{|position| position if position == "X" || position == "O"}
      return turncount.size
    end

    def current_player
      if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
    end

    def position_taken?(location)
      @board[location] != " " && @board[location] != ""
    end


    def valid_move?(position)
      position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
    end

    def move(location, player="#{current_player}")
      location = location.to_i - 1
      @board[location] = player
    end

    def won?
      if @board.all?{ |loc| loc == " " }
      return false
      end
        WIN_COMBINATIONS.each do |combo|
      if (@board[combo[0]] == "X" || @board[combo[0]] == "O") && @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]]
      return combo
       end
       end
      return false
      end

    def full?
      if @board.any?{ |loc| loc == " " }
      return false
      else
      return true
      end
      end

    def draw?
    if won? || !full?
    return false
    else
    return true
    end
    end

    def over?
    if draw? || won?
    return true
    else
    return false
    end
    end

    def turn
        puts "Please enter 1-9:"
        input = gets.strip
      if !valid_move?(input)
          puts "Please enter 1-9:"
          input = gets.strip
      end
         move(input, player="#{current_player}")
         display_board
    end

   def winner
    if !won?
    return nil
    else
    WIN_COMBINATIONS.each do |combo|
      if (@board[combo[0]] == "X" || @board[combo[0]] == "O") && @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]]
        return @board[combo[0]]
        @board[combo[0]] = win
        win.detect {|winner| winner = "X" || winner = "O"}
        return winner
      end
      end
      end
      end

    def play
      until over?
       turn
      end
      if won? && !draw?
        puts "Congratulations #{winner}!"
      else
        puts "Cats Game!"
      end
    end

end