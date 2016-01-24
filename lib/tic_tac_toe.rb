# Define your WIN_COMBINATIONS constant
class TicTacToe
 WIN_COMBINATIONS = [[0,1,2],
                  [3,4,5],
                  [6,7,8],
                  [0,3,6],
                  [1,4,7],
                  [2,5,8],
                  [0,4,8],
                  [6,4,2]]

 attr_accessor :board

  def initialize(board=nil)
    @board = board || Array.new(9," ")
  end

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def move(location, player = 'X')
    board[location.to_i-1] = player
  end


  def position_taken?(location)
    board[location] != " "
  end
  
  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end 
    
  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    if !valid_move?(input)
      turn
    end
    player = current_player
    move(input, player)
    display_board
  end
  
  def turn_count
    count = 0
    board.each do |cell|
      if cell == 'X' || cell == 'O'
        count += 1
      end
    end
    count
  end
  

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
  
      # load the value of board at specified index
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
  
      if position_1 == 'X' && position_2 == 'X' && position_3 == 'X'
        return win_combination
      elsif position_1 == 'O' && position_2 == 'O' && position_3 == 'O'
        return win_combination
      end
    end
    false
  end
    

  def current_player
    !!turn_count.odd? ? "O" : "X"
  end

  def draw?
    !won? && full?
  end
  
  def full?
    board.all?{ |token| token == 'X' || token == 'O' }
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    position = won?
    if won? == false
      nil
    elsif board[position[0]] == 'X' && board[position[1]] == 'X' && board[position[2]] == 'X'
      'X'
    elsif board[position[0]] == 'O' && board[position[1]] == 'O' && board[position[2]] == 'O'
      'O'
    end
  end

  def draw?
    !won? && full?
  end
  
  def full?
    board.all?{ |token| token == 'X' || token == 'O' }
  end
  
  def over?
    won? || draw?
  end
  

  def play
    until over?
      turn
    end
    if winner== 'X'
      puts 'Congratulations X!'
    elsif winner== 'O'
      puts 'Congratulations O!'
    elsif draw?
      puts "Cats Game!"
    end
  end
  
end
