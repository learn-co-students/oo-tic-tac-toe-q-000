class TicTacToe

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

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    print " #{@board[0]} |" + " #{@board[1]} |" + " #{@board[2]} \n------------\n"
    print " #{@board[3]} |" + " #{@board[4]} |" + " #{@board[5]} \n------------\n"
    print " #{@board[6]} |" + " #{@board[7]} |" + " #{@board[8]} \n------------\n"
  end

  def move (position, player_id="X")
  
    @board[(position.to_i - 1)] = player_id
    return @board
  
  end

  def position_taken?(position)
    !(@board[position].nil? || @board[position] == " ")
      #puts "That one's taken."
  end


  def valid_move?(position)
    if position.to_i.between?(1, 9) == false
      #puts "not on the board"
      return false
    elsif position_taken?(position.to_i - 1) == true
      return false
    else
      return true
    end
  end


  def turn
    puts "\e[H\e[2J"
    display_board
    player_id = current_player
    puts "Make your move #{current_player}. Enter 1-9."
    position = gets.strip
    #player_id = current_player
    if valid_move?(position) == false
      puts "Try again."
      turn
    else
      move(position, player_id)
    end
  end


  def turn_count
    count = 0
    @board.each do |position|
      if position != " "
        count += 1
      end
    end
    return count
  end


  def current_player
    turn_count % 2 == 0 ? "X" : "O" 
  end


  def won?
    if @board.all? {|position| position == " "}
      
      return false
    elsif WIN_COMBINATIONS.each {|winning_array|
      if winning_array.all? {|position| @board[position] == "X" }
        display_board
        puts "Congratulations X!"
        return winning_array
      elsif winning_array.all? {|position| @board[position] == "O"}
        display_board
        puts "Congratulations O!"
        return winning_array
      end
        }
      return false
    end    
  end


  def full?
    WIN_COMBINATIONS.all? {|winning_array|
      winning_array.all?{|position| position_taken?(position)}
    }
  end

  def draw?
    if won? == false && full? == true
      puts "\e[H\e[2J"
      display_board
      puts "Cats Game!"
      return true
    end
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      return @board[won?.to_a[0]]
    end
  end


  def play
    until over?
      turn
    end
  end

end
