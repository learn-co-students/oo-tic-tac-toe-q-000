WIN_COMBINATIONS=[[0, 1, 2],[3, 4, 5],[6, 7, 8],[0, 3, 6],[1, 4, 7],[2, 5, 8], [0, 4, 8], [6, 4, 2]]

board=["X", " ", "X", " ", "X", " ", "O", "O", " "]

def won?(board)
  WIN_COMBINATIONS.each do |array|
    board_elements=[]
    if board[array[0]] == "X" || board[array[0]] == "O"
    board_elements << board[array[0]]
    board_elements << board[array[1]]
    board_elements << board[array[2]]
  end
if board_elements[0] == board_elements[1] && board_elements[0] == board_elements[2] 
  puts board_elements
end
end
return false
end

def full?(board)
  board.each do |slot|
  if slot != "X" && slot != "O"
    return false
  end
end
end

def draw?(board)
  if won?(board) == false && full?(board) 
    return true
  else return false
  end 
end

def over?(board)
  if draw?(board) || full?(board) || won?(board)
    return true
  else
    return false
  end
end

puts over?(["X", " ", "X", " ", "X", " ", "O", "O", " "])