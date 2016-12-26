class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
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
    [0, 4, 8],
    [6, 4, 2]
]

    def move(location, current_player)
      @board[location.to_i-1] = current_player
    end

    def position_taken?(location)
      @board[location] != " " && @board[location] != ""
    end

    def valid_move?(position)
      position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
    end

    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      if valid_move?(input)
        move(input, current_player)
      else
        turn
      end
      display_board
    end

    def won?
        for win_combination in WIN_COMBINATIONS do
            if ((@board[win_combination[0]] == @board[win_combination[1]]) && (@board[win_combination[1]] == @board[win_combination[2]])) && @board[win_combination[0]] != " "
                return win_combination
            end
        end
        return false
    end

    def full?
        !@board.include?(" ")
    end

    def draw?
        full? && !won?
    end

    def over?
        full? || draw? || won?
    end

    def winner
        if won?
            return @board[won?[0]]
        else
            return nil
        end
    end

    def play
        until over? do
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cats Game!"
        end
    end

end
