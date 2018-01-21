class TicTacToe
    def initialize(board = nil)
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

    def board
        @board
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------" 
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def move(position, mark='X')
        position = position.to_i
        @board[position-1] = mark
    end

    def position_taken?(position)
        if @board[position] == "" || @board[position] == ' ' || @board[position] == nil
            return false
        else
            return true
        end
    end

    def valid_move?(position)
        position = position.to_i
        index = position - 1
        if position.between?(1,9)
            if position_taken?(index)
                return false
            else
                return true
            end
        end
    end

    def turn
        puts "Please enter 1-9:"
        position = gets.strip
        if valid_move?(position)
            move(position, current_player)
        else
            turn
        end
        display_board
    end

    def turn_count
        count = 0
        @board.each do |spot|
            if spot == "X" || spot == "O"
                count += 1
            end
        end
    return count
    end

    def current_player
        plays = turn_count
        return plays % 2 == 0 ? 'X' : 'O'
    end

    def won?
    #returns the winning combination
        WIN_COMBINATIONS.each do |win_combo|
            win_index_1 = win_combo[0]
            win_index_2 = win_combo[1]
            win_index_3 = win_combo[2]

            position_1 = @board[win_index_1]
            position_2 = @board[win_index_2]
            position_3 = @board[win_index_3]
    
            if position_1 == 'X' && position_2 == 'X' && position_3 == 'X'
                return win_combo
            elsif position_1 == 'O' && position_2 == 'O' && position_3 == 'O'
                return win_combo
            end
        end
        return false
    end

    def full?
         @board.none?{|i| i == " "}
    end

    def draw?
        if won? == false && full? == true
            return true
        else
            return false
        end
    end

    def over?
        if draw? || won? || full?
            return true
        else
            return false
        end
    end

    def winner
        if won?
            @board[won?[0]]
        else
            return nil
        end
    end

    def play
        display_board
        9.times do
            if over?
                if draw?
                    puts "Cats Game!"
                    break
                else
                    puts "Congratulations #{winner}!"
                    break
                end
            else
                turn
            end
        end
    end

end