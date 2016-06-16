class TicTacToe

    def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end

    WIN_COMBINATIONS = [
        [0,1,2], #Top row
        [3,4,5], #middle row
        [6,7,8], #bottom row
        [0,3,6], #left row
        [1,4,7], #middle row
        [2,5,8], #right row
        [0,4,8], #cross row
        [6,4,2] #cross row
      ]

        def play
          until over?
            turn
          end
          message
        end

        def turn
          puts "Please enter 1-9:"
          input = gets.strip
          index = input_to_index(input)
          if valid_move?(input) == true
            move(input, current_player)
            display_board
          else
            turn
          end
        end

        def message
          if over?
            if won?
              puts "Congratulations #{winner}!"
            elsif draw?
              puts "Cats Game!"
            end
          end
        end

      def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      end

      def input_to_index(input)
        input.to_i - 1
      end

      def move(input, current_player = "X")
        @board[input_to_index(input)] = current_player
      end

      def position_taken?(location)
        @board[location] != " " && @board[location] != ""
      end

      def valid_move?(input)
        index = input_to_index(input)
        index.between?(0,8) && !position_taken?(index)
      end

      def turn_count
        counter = 0
        @board.each do |position|
          if position == "X" || position == "O"
            counter += 1
          end
        end
        return counter
      end

      def current_player
          if turn_count.even?
            "X"
          else
            "O"
          end
      end

      def won?
          WIN_COMBINATIONS.each do |position|
            if @board[position[0]] == "X" && @board[position[1]] == "X" && @board[position[2]] == "X"
                return position
            elsif @board[position[0]] == "O" && @board[position[1]] == "O" && @board[position[2]] == "O"
                return position
            end
          end
          false
      end


      def full?
        !@board.any?{|field| field == " "}
      end

      def draw?
        !won? && full?
      end

      def over?
        won? || draw? || full?
      end

      def winner
        WIN_COMBINATIONS.each do |position|
          if @board[position[0]] == "X" && @board[position[1]] == "X" && @board[position[2]] == "X"
              return "X"
          elsif @board[position[0]] == "O" && @board[position[1]] == "O" && @board[position[2]] == "O"
              return "O"
          end
        end
        nil
      end

end
