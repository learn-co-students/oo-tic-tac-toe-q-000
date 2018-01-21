class TicTacToe

  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
  ]

  def initialize
    @board = Array.new(9,' ')
  end

  def play
    if !over?
      turn
      play
    elsif won?
      puts "Congratulations #{winner}!"
    else
      puts 'Cats Game!'
    end
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(player_location, player_character = 'X')
    @board[player_location-1] = player_character
  end

  def position_taken?(board_position)
    @board[board_position] != ' ' ? true : false
  end

  def valid_move?(player_location)
      player_location.to_i.between?(1,9) && !position_taken?(player_location.to_i-1)
  end

  def turn
    puts 'Please enter your desired location: 1 - 9'
    player_location = gets.strip.to_i
    valid_move?(player_location) ? move(player_location, current_player) : turn
    display_board
  end

  def turn_count
    @board.select{|location| location != ' '}.size
  end

  def current_player
    turn_count % 2 == 0 ? 'X' : 'O'
  end

  def won?
    WIN_COMBINATIONS.detect do |cell|
      @board[cell[0]] == @board[cell[1]] && @board[cell[1]] == @board[cell[2]] && position_taken?(cell[0])
    end
  end

  def full?
    @board.all? {|cell| cell == 'X' || cell == 'O'}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if won?
      the_winner = won?
      @board[the_winner[0]]
    else
      nil
    end
  end

end
