class TicTacToe

    WIN_COMBINATIONS = [
        # Rows combinations
        [0,1,2],
        [3,4,5],
        [6,7,8],
        # Columns combinations
        [0,3,6],
        [1,4,7],
        [2,5,8],
        # Diagonals combinations
        [0,4,8],
        [2,4,6]
    ]

    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end

    def board=(board)
        @board = board
    end

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

    def move(user_move, current_player)
        index = input_to_index(user_move)
        @board[index] = current_player
    end

    def input_to_index(user_input)
      user_input.to_i - 1
    end

    def position_taken?(location)
      @board[location] != " " && @board[location] != ""
    end

    def valid_move?(user_move)
        index = input_to_index(user_move)
        index.between?(0,8) && !position_taken?(index)
    end

    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      if valid_move?(input)
        player = current_player
        move(input, player)
        display_board
      else
        turn
      end
    end

    def turn_count
        counter = 0
        @board.each do | position |
            if position == "X" || position == "O"
                counter += 1
            end
        end
        counter
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def won?
        WIN_COMBINATIONS.each do |combo|
            # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
            # grab each index from the win_combination that composes a win
            if @board[combo[0]] != " " && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
                return combo
            end
        end
        false
    end

    def full?
        @board.all? do |move|
            move == "X" || move =="O"
        end
    end

    def draw?
        !won? && full?
    end

    def over?
        draw? || full? || won? != false
    end

    def winner
        if win = won?
            @board[win.first]
        end
    end

    def play
      while !over?
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cats Game!"
      end
    end
end
