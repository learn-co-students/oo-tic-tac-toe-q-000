class TicTacToe

  WIN_COMBINATIONS = [
      [0,1,2], # Top row
      [3,4,5],  # Middle row
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2],
    ]

  def initialize()
    @board = Array.new(9, " ")
  end

  def turn_count()
    count=0
    @board.each do |space|
      if space == "X" || space == "O"
        count+=1
      end
    end
      count
  end

  def current_player()
    turnCount=turn_count()
    if turnCount % 2 == 0
      "X"
    else
      "O"
    end
  end

  def turn()

    while true
      puts "Please enter 1-9:"
      input=gets.strip
      if valid_move?(input)
        move(input, current_player)
        display_board()
        break
      end
    end

  end

  def valid_move?(position)
    puts "#{@board.to_s} #{@position.to_s}"
    position=position.to_i
    correctIndex = position <= 9 && position >= 1
    taken = position_taken?(position-1)

    if correctIndex && taken==false
      true
    else
      false
    end
  end

  # re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
  def position_taken?(position)
    if @board[position]=="X" || @board[position]=="O"
      true
    else
      false
    end
  end

  def move(index, choice=(no_argument_passed=true; "X"))
    @board[index.to_i-1]=choice
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def won?
    win_combinations=WIN_COMBINATIONS
    win_combinations.detect do |combos|
      if position_taken?(combos[0]) && position_taken?(combos[1]) && position_taken?(combos[2])
        status = @board[combos[0]]==@board[combos[1]] && @board[combos[1]]==@board[combos[2]]
        status
      end
    end
  end

  def full?()
    @board.all? do |space|
      !(space.nil? || space == " ")
    end
  end

  def draw?()
    (full?() && !won?())
  end

  def over?()
    (draw?() || won?())
  end

  def winner()
    if won?() != nil
      champ = won?()
      return @board[champ[0]]
    else
      nil
    end
  end

  def play()
    until over?() do
        turn()
    end
    if won?()
      puts "Congratulations #{winner()}!"
    elsif draw?()
      puts "Cats Game!"
    end
  end

end