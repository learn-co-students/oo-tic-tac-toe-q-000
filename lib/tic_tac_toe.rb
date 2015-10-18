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
  [1,4,7],
  [2,5,8]
  ]

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

  def move(location,player = "X")
      @board[location.to_i-1] = player
  end

  def position_taken?(location)
      !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
      input = position.to_i - 1
      if !input.between?(0,8)
        false
      elsif position_taken?(input)
        false
      else
        true
      end
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
       index =[0,1,2,3,4,5,6,7,8]
       @x_pos = index.select {|position| @board[position] == "X"}
       @o_pos = index.select {|position| @board[position] == "O"}
       WIN_COMBINATIONS.each do |combination|
           if combination.all? {|position| @x_pos.include?(position)} || combination.all? {|position| @o_pos.include?(position)}
               return combination
           else
           end
       end
       return false
    end

    def full?
        if @board.all? {|position| position == "X" || position =="O" }
            true
        else
            false
        end
    end

    def draw?
        if !won? && full?
            true
        elsif won?
            false
        elsif !won? && !full?
            false
        end
    end

    def over?
        if won? || full? || draw?
            true
        else
          false
        end
    end

    def winner
        if !won?
            return nil
        else
        index =[0,1,2,3,4,5,6,7,8]
        WIN_COMBINATIONS.each do |combination|
            if combination.all? {|position| @x_pos.include?(position)}
                return "X"
            elsif combination.all? {|position| @o_pos.include?(position)}
                return "O"
            else
            end
        end
    end

end
end