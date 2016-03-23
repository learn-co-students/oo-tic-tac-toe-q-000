class TicTacToe
   
    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end
    
    def board
       @board
    end
    
    #display_board
    def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end
    
    WIN_COMBINATIONS = [[ 0, 1, 2], [ 3, 4, 5],[ 6, 7, 8],[ 0, 3, 6],[ 1, 4, 7],[ 2, 5, 8],[ 0, 4, 8],[ 6, 4, 2]]
    
    #move - sets the input
    def move(input, n = "X")
        @board[input.to_i-1] = n
    end
    
    #convert location to integer and apply to board array
    def position(input)
        @board[input.to_i]
    end

    #is the position_taken?
    def position_taken?(input)
        if position(input) == "" || position(input) == " " || position(input) == nil
            return false
        else
            return true
        end
    end
    
    #valid_move
    def valid_move?(position)
        input = position.to_i - 1
        if !position_taken?(input) && input.between?(0,8)
            return true
        else
            return false
        end
    end
    
    #turn
    def turn
        display_board
        puts "Please enter 1-9:"
        input = gets.strip
        if !valid_move?(input)
            turn
        end
        move(input, current_player)
        display_board
    end
    
    #turn_count
    def turn_count
        counter = 0
        board.each do |space|
            if  space == "X" || space == "O"
                counter += 1
            end
    end
        return counter
    end
    
    #current_player
    def current_player
        o_player = "O"
        x_player = "X"
        if turn_count == 0
            return x_player
        elsif turn_count % 2 == 0
            return x_player
        else
            return o_player
        end
    end
    
    #won
    def won?
        WIN_COMBINATIONS.each do |win_combination|
            win_index_1 = win_combination[0]
            win_index_2 = win_combination[1]
            win_index_3 = win_combination[2]
            
            position_1 = board[win_index_1]
            position_2 = board[win_index_2]
            position_3 = board[win_index_3]
            
            if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" &&position_2 == "O" && position_3 == "O"
                return win_combination
            end
        end
        return false
    end
    
    #full?
    def full?
        board.all? do |space|
            space == "X" || space == "O"
        end
    end
    
    #draw?
    def draw?
        if !won? && full?
            return true
        elsif !won? && !full?
            return false
        else won?
            return false
        end
    end
    
    #over?
    def over?
        if won? || draw? || full?
            return true
        else
            return false
        end
    end
    
    #winner
    def winner
        win_combination = won?
        if win_combination
            board[win_combination[0]]
        end
    end
    
    #play
    def play
        turn until over?
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cats Game!"
        end
    end
end