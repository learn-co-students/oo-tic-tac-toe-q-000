class TicTacToe
  def initialize (board = nil)
    @board = board || Array.new(9, " ")
  end

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

  def play 
    until over?()
      turn()
    end

    if won?()
      puts "Congratulations #{winner()}!"
    elsif draw?()
      puts "Cats Game!"
    end
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, current_player = "X")
    @board[location.to_i-1] = current_player
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player())
    else
      turn()
    end
    display_board()
  end

  def turn_count
    total_turns = 0

    @board.each do |space|
      if space == 'X' || space =='O'
        total_turns+=1
      end
    end

    total_turns
  end

  def current_player
    turns = turn_count()
    turns % 2 == 0 ? 'X' : 'O'
  end

  def won?
    winning = WIN_COMBINATIONS.select do |combo_array|
      pos_1 = combo_array[0]
      pos_2 = combo_array[1]
      pos_3 = combo_array[2]

      space_1 = @board[pos_1]
      space_2 = @board[pos_2]
      space_3 = @board[pos_3]

      (space_1 == 'X' && space_2 == 'X' && space_3=='X') || (space_1 == 'O' && space_2 == 'O' && space_3=='O')
    end
    winning == [] ? false : winning[0]
  end

  def full?
    all_full = @board.all? do | space |
      space == 'X' || space == 'O'
    end
    all_full
  end

  def draw?
    full?() && !won?()
  end

  def over?
    full?() || draw?() || won?()
  end

  def winner
    win_array = won?()
    win_array ? @board[win_array[0]] : nil
  end
end