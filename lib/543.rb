require_relative "board"

require "pry"

module Game543
  puts "Starting up"
  board = Board.new
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
    break if status == :winner
  end
end
