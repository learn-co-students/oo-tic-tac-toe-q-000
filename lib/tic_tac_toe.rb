class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(position_input)
    position_input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    if position_taken?(index) == true || index < 0 || index > 8
      false
    else
      true
    end
  end
  
  def turn_count
    @board.select{|token| token == "X" || token == "O"}.count
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end
  
  def turn
    puts "What is your move? Choose a position between 1-9."
    position_input = gets.to_i
    index = input_to_index(position_input)
    if valid_move?(index) == false
      until valid_move?(index)
        puts "Invalid move. Choose a position between 1-9."
        position_input = gets.to_i
        index = input_to_index(position_input)
      end
    else
      @board[index] = current_player
      display_board
    end
  end
  
  def won?
    win_combination = WIN_COMBINATIONS.find{|combination|
    @board[combination[0]] == "X" && @board[combination[1]] == "X"&& @board[combination[2]] == "X"|| @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"}
    
    if win_combination == nil
      false
    else
      win_combination
    end
  end
  
  def full?
    @board.all?{|position| position == "X" || position == "O"}
  end
  
  def draw?
    if won? == false && full? == true
      true
    end
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play 
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!" 
    else
      puts "Congratulations #{winner}!"
    end
  end

end














