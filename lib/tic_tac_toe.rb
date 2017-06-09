class TicTacToe

    WIN_COMBINATIONS = [
    [0, 1, 2], # Top row
    [3, 4 ,5], # Middle row
    [6, 7, 8], # Bottom Row
    [0, 3, 6], # Left column win
    [1, 4, 7], # Middle column win
    [2, 5, 8], # Right column win
    [0, 4, 8], # Left diagonal win
    [6, 4, 2], # Right diagonal win
    ]

    def initialize()
      @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def move(input, char = "X")
     @board[input.to_i-1] = char
    end

    def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
    end

    def valid_move?(input)
    if input.to_i.between?(1,9)
    if !position_taken?(input.to_i-1)
      true
    end
    end
    end

    def turn
    puts "Please enter 1-9:"
    input = gets
    if valid_move?(input)
    move(input, current_player)
     else turn
    end
    display_board
    end

    def won?
    WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] &&
    @board[combo[1]] == @board[combo[2]] &&
    position_taken?(combo[0])
    end
    end

    def turn_count
    @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
    turn_count % 2 == 0 ? "X" : "O"
    end

    def full?
    @board.all? { |token| token == "X" || token == "O"}
    end

    def draw?
    !won? && full?
    end

    def over?
    won? || draw?
    end

    def winner
    if winning_combo = won?
    @board[winning_combo.first]
    end
    end

    def play
     while !over?
    turn
    end
      return puts "Congratulations #{winner}!" if won?
      return puts "Cats Game!" if draw?
    end

end