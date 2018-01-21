class TicTacToe

    WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2] ]

    def initialize
        @board = [
            " ", " ", " ",
            " ", " ", " ",
            " ", " ", " "
        ]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def move(position, marker="X")
        @board[position-1] = marker
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
        input = input.to_i
        marker = current_player
        if valid_move?(input) == true
            move(input, marker)
        else
            turn
        end
        display_board
    end

    def turn_count
        counter = 0

        @board.each do |cell|
            if (cell == "X") || (cell == "O")
              counter += 1
            end
        end

        return counter
    end

    def current_player
        num_turns = turn_count

        if num_turns % 2 == 0
            return "X"
        else
            return "O"
        end
    end

    def won?
        WIN_COMBINATIONS.each do |win_combo|
            win_index_1 = win_combo[0]
            win_index_2 = win_combo[1]
            win_index_3 = win_combo[2]

            board_position_1 = @board[win_index_1]
            board_position_2 = @board[win_index_2]
            board_position_3 = @board[win_index_3]

            if board_position_1 == "X" && board_position_2 == "X" && board_position_3 == "X"
                return win_combo
            elsif board_position_1 == "O" && board_position_2 == "O" && board_position_3 == "O"
                return win_combo
            end
        end
        false
    end

    def full?
        @board.all? do |cell|
            cell == "X" || cell == "O"
        end
    end

    def draw?
        game_won = won?
        if game_won != false
            return false
        end
        board_full = full?
    end

    def over?
        game_won = won?
        game_draw = draw?
        if game_won == false && game_draw == false
            board_full = full?
            if board_full == true
                return true
            else
                return false
            end
        else
            return true
        end
    end

    def winner
        game_won = won?
        if game_won == false
            return nil
        else
            winner_index = game_won[0]
            return @board[winner_index]
        end
    end

    def play
        until over? == true do
            turn
        end

        if won? != false
            winning_side = winner
            puts "Congratulations #{winning_side}!"
        elsif draw? == true
            puts "Cats Game!"
        end
    end

end

