class TicTacToe
    WIN_COMBINATIONS = [
      [0,1,2],  # Top row
      [3,4,5],  # Middle row
      [6,7,8],  # Bottom row
      [0,3,6],  # Left column
      [1,4,7],  # Middle column
      [2,5,8],  # Right column
      [0,4,8],  # Backslash diagnol
      [6,4,2]   # Slash diagnol
    ]

    def initialize(board = [ " ", " ", " ", " ", " ", " ", " ", " ", " " ])
        @board = board
    end

    def get_board
        @board
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def display_square_numbers
        puts " 1 | 2 | 3 "
        puts "-----------"
        puts " 4 | 5 | 6 "
        puts "-----------"
        puts " 7 | 8 | 9 "
    end

    def display_winning_line
        line = 0
        box = 0
        index = 0
        while line < 5
            if line % 2 == 0
                while box < 3
                    if winning_line.include?(index)
                        print " \e[31m#{@board[index]}\e[0m "
                    else
                        print " #{@board[index]} "
                    end
                    if box < 2
                        print "|"
                    end
                    index += 1
                    box += 1
                end
            else
                print "-----------"
                box = 0
            end
            print "\n"
            line += 1
        end
    end

    def move(square, letter = "X")
        @board[square - 1] = current_player
    end

    def position_taken?(square)
        !(@board[square].nil? || @board[square] == " ")
    end

    def valid_move?(square)
        square = Integer(square) rescue nil
        square != nil && !position_taken?(square - 1)
    end

    def turn
        input = 0
        while !input.between?(1, 9) do
            puts "Select an available box to enter an #{current_player}"
            input = gets.strip.to_i
        end

        move(input) if valid_move?(input)
        if won?
            display_winning_line
        else
            display_board
        end
#         display_board
    end

    def turn_count
        @board.count{ |x| x == "X" } + @board.count{ |o| o == "O" }
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def won?
        winning_line().size == 3
    end

    def winning_line
        line = []
        WIN_COMBINATIONS.each do |lines|
            if @board[lines[0]] == @board[lines[1]] && @board[lines[0]] == @board[lines[2]] && @board[lines[0]] != " "
                line = lines
            end
        end

        line
    end

    def full?
        turn_count == 9
    end

    def draw?
        full? && !won?
    end

    def over?
        full? || won?
    end

    def winner
        @board[winning_line[0]] if won?
    end

    def play
        print %x{clear}
        if won?
            puts "Congratulations #{winner}!"
            return
        end

        if draw?
            puts "Cats Game!"
            return
        end

        display_square_numbers

        until over? do
            turn
            if won?
                puts "Congratulations #{winner}!"
                return
            elsif draw?
                puts "Cats Game!"
                return
            end
        end
    end
end