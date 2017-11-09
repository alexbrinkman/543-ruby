require_relative "board"
require "pry"

board = Game543::Board.new
puts board

loop do
  puts "Your move: (row)"
  row = gets.chomp
  puts "Your move: (num)"
  num = gets.chomp

  begin
    status = board.move(row, num)
  rescue ArgumentError => e
    puts e.message
  end
  puts board

  if board.winner?
    puts "WINNER!"
    exit
  end
  
end
