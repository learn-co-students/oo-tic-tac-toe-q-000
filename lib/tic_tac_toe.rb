class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [6,4,2]
  ]

  def initialize
    @board = Array.new(9, ' ')
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, player = 'X')
    index = position.to_i - 1
    @board[index] = player
  end

  def position_taken?(index)
    return false if index == "" ||
                    @board[index] == " "
    true
  end

  def valid_move?(position)
    index = position.to_i - 1
    return true unless position =~ /\D/ ||
                       position.to_i > @board.length ||
                       position_taken?(index) == true 
    false
  end

  def turn
    puts 'Please enter 1-9:'
    player_move = gets.strip
    turn unless valid_move?(player_move)

    marker = turn_count.even? ? 'X' : 'O'

    move(player_move, marker)

    display_board
  end

  def turn_count
    count = 0 

    @board.each_with_index do |cell, index|
      count += 1 if cell.include?('X') || cell.include?('O')
    end

    count
  end

  def current_player
    turn = turn_count

    if (turn + 1).odd? || turn == 0
      return 'X'
    else
      return 'O'
    end 
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      combination_result = []
      combination.each do |index|
        combination_result << @board[index]
      end

      return combination if combination_result.all?{ |cell| cell == 'X' } ||
                                   combination_result.all?{ |cell| cell == 'O' }
    end

    false
  end

  def full?
    return true if @board.none?{ |cell| cell == " " }
    false
  end

  def draw?
    return true if full? && !won?
    false
  end

  def over?
    return true if draw? || won?
    false
  end

  def winner
    winner_combo = won?

    return @board[winner_combo[0]] unless winner_combo == false
    nil
  end

  def play
    until over?
      turn
    end

    if !won?
      puts "Cats Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
end
