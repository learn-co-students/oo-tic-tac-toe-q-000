class TicTacToe
  def initialize
    @board = Array.new(9, " ")  #http://ruby-doc.org/core-2.3.0/Array.html   ...forgot about this way
  end

 WIN_COMBINATIONS = [
      [0,1,2],  # Top row
      [3,4,5],  # Middle row
      [6,7,8],  # bottom row
      [0,3,6],  # left column
      [1,4,7],  # Middle column
      [2,5,8],  # right column
      [0,4,8],  # diagonal 1
      [6,4,2]   # diagonal 2
    ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def move(location,player)
    location = location - 1
    @board[location] = player
  end

  def position_taken?(position)  # %q (single quoted string) hmmm makes an array??? odd??
    %q{'X','O'}.include? @board[position.to_i]
  end

  def valid_move?(position)
    position_taken?(position.to_i - 1) == false && (1..9).include?(position.to_i)  # ruby apparently hates spaces<< after .include?
  end

 def turn
    user_input = gets.chomp
    user_input = user_input.to_i
    if valid_move? (user_input)
      move(user_input,current_player)
    else
      puts 'that move is not valid human'
      turn
    end
  end

  def full?
    @board.all? {|x| x == 'X' || x == 'O'}
  end

  def won?
    win = 'NO'
    @x_has_won = 'NO'
    @o_has_won = 'NO'
    WIN_COMBINATIONS.each do |row|    # neat how .each works, each array bracket section is an "each"
      if    row.all? {|x| @board[x] == 'X'}
        win = 'yes'
        @x_has_won = 'yes'
      elsif row.all? {|x| @board[x] == 'O'}
         win = 'yes'
        @o_has_won = 'yes'
      end
    end
    if win == 'yes'
      true
    end
  end

  def draw?
    won? != true && full? == true
  end

  def over?
    draw? == true || won? == true
  end

  def winner
   won?
    if won? == false         # this MUST go first<< because the @x.... will store the last win
      return nil
    elsif @x_has_won == 'yes'
      return 'X'
    elsif @o_has_won == 'yes'
      return 'O'
    end
  end

  def play
    until over?
    turn
    display_board
    end
    if    @x_has_won == 'yes'
      puts 'Congratulations X!'
    elsif @o_has_won == 'yes'
      puts 'Congratulations O!'
    elsif draw? == true
      puts 'Cats Game!'
    end
  end

end