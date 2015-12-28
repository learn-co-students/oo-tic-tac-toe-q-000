class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  
  WIN_COMBINATIONS = [
    [0, 1, 2],  
    [3, 4, 5],  
    [6, 7, 8],  
    [0, 3, 6],  
    [1, 4, 7],  
    [2, 5, 8],  
    [6, 4, 2],
    [0, 4, 8],  
  ] 
  
  
  def move(input, token="X")
    sq = input.to_i - 1
    @board[sq] = token
  end
  
  
  def position_taken?(input)
    sq = @board[input]
    sq == " " || sq == "" || sq == nil ? false : true
  end
  
  
  def valid_move?(input)
    move = input.to_i - 1
    (0..8) === move ? (position_taken?(move) ? false : true) : false
  end
  
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    
    if valid_move?(input)
      token = current_player
      move(input, token)
    else
      turn
    end
    
    display_board
  end
  
  
  def current_player
    turns = turn_count
    turns % 2 == 0 ? "X" : "O"
  end
  
  
  def turn_count
    count = 0
    @board.each { |sq| count += 1 unless sq == " " || sq == "" || sq == nil }
    
    count
  end
  
  
  def won?
    winner = []
    check_win = -> xs_or_os do
      (winner = xs_or_os; break) if xs_or_os.size == 3 
    end
    
    WIN_COMBINATIONS.each do |combo|
      xs = []
      os = []
      combo.each do |windex|
        position = @board[windex]
        case position
        when "X"
          xs << windex
        when "O"
          os << windex
        end 
        check_win.call(xs)
        check_win.call(os)
      end
    end
    
    (winner.empty?) ? false : winner 
  end

  
  def full?
    e = [" ", "", nil]
    full_board = true
    e.each { |empty| (full_board = false; break) if @board.include?(empty) }
    
    full_board
  end
  
  
  def draw?
    if won? != false
      false
    elsif full? == false
      false
    else
      true
    end  
  end
  
  
  def over?
    if draw? == true
      true
    elsif won? != false
      true
    elsif full? == false
      false
    end
  end
  
  
  def winner
    if won? == false
      nil
    else
      winning_combo = won?
      winning_square = winning_combo[0]
      @board[winning_square] == "X" ? "X" : "O"
    end
  end
  
  
  def play
    turn until over? == true
    
    if won? != false
      puts "Congratulations #{winner}!"
      puts "You have won!"
    else
      puts "Cats Game!"
    end
  end
  
end


