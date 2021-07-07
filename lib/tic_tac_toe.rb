class TicTacToe




    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end

WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [6,4,2],
    [0,3,6],
    [2,5,8],
    [1,4,7]
]
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def move(location, player = "X")
        @board[location.to_i-1] = player
    end


    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def play
        while !over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cats Game!"
        end
    end

    def turn_count
        @board.count{|number| number == "X" || number == "O"}
    end

    def position_taken?(location)
        @board[location] == "X" || @board[location] == "O"
    end

    def valid_move?(location)
        location.to_i.between?(1,9) && !position_taken?(location.to_i-1)
    end

    def turn
        puts "Please enter 1-9:"
        input = gets.strip
        if !valid_move?(input)
            turn
        else
            move(input, current_player)
            display_board
        end
    end


    def won?
        WIN_COMBINATIONS.detect do |combo|
            @board[combo[0]] == @board[combo[1]] && @board[combo[2]] == @board[combo[1]] && position_taken?(combo[0])
        end
    end

    def full?
        @board.all? { |position| position.strip.size > 0 }
    end

    def draw?
        !won? && full? ? true : false
    end

    def over?
        won? || draw?
    end

    def winner
        winner = won?
        if winner
            @board[winner[0]]
        end
    end

end
