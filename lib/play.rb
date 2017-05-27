def play
  play = TicTacToe.new
  until over?
      turn
      turn_count
  end
  if winner == "X"
    puts "Congratulations X!"
  elsif winner == "O"
    puts "Congratulations O!"
  else draw?
    puts "Cats Game!"
  end
end

play
