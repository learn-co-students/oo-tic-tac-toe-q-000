class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

WIN_COMBINATIONS =
    [
    [0,1,2], #top row
    [3,4,5], #mid row
    [6,7,8], #bottom row
    [0,4,8], #right diag
    [6,4,2], #left diag
    [0,3,6], #left column
    [1,4,7], #mid column
    [2,5,8] #right col
    ]

  def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, character)
    position.to_i
    position = position - 1
    @board[position] = character
    puts "#{@board}"
  end

  def position_taken?(position)
    if @board[position] == " " || @board[position] == "" || @board[position] == nil
      return false
    else @board[position] == "X" || @board[position] == "O"
      return true
    end
  end

  def valid_move?(position)
    #binding.pry
      if position.to_i.between?(1, 9)
        postionvar = position.to_i - 1
          if position_taken?(postionvar) == false
            return true
          else position_taken?(postionvar) == true
            return nil
          end
      else
        return false
    end
  end
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    location = input.to_i
    if valid_move?(location)
      move(location, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
      @board.each do |boardxy|
        if boardxy == "X" || boardxy[counter] == "O"
          counter += 1
        end
      end
    return counter
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win1|
      win1.all? { |number| @board[number] == "X"} || win1.all? { |number| @board[number] == "O"}
      end
    end

    def full?
      !@board.any? {|i| i == " "}
    end

    def draw?
      if !won? && full?
        return true
      else
        return false
      end
    end

    def over?
      if won? || draw? || full?
        return true
      end
    end

    def winner
      if won?
        won?.each do |each|
          puts "Congratulations #{@board[each]}!"
          return @board[each]
        end
      end
    end

    def play
      while !over?
        turn
      end
      if won?
        winner
      elsif draw? == true
        puts "Cats Game!"
      end
    end

  end
