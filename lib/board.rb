module Game543

  class Board

    def initialize
      @position = [
        [true, true, true],
        [true, true, true, true],
        [true, true, true, true, true]
      ]
    end

    def move(row, num)
      row = row.to_i
      num = num.to_i
      validate_move(row, num)
      update_board(row, num)
      if winner?
        puts "WINNER!"
        return :winner
      end
      :ok
    end

    def to_s
      puts "---------"
      @position.each do |row|
        row.select { |e| e }.size.times { print "O " }
        puts "\n"
      end
      puts "---------"
    end

    private

    def validate_move(row, num)
      raise ArgumentError.new("Invalid row: please enter 1, 2, or 3")  if row < 1 || row > 3
      raise ArgumentError.new("Invalid num: please enter at least 1 piece.") if num < 1
      raise ArgumentError.new("Invalid num: please enter no more than the number remaining in the row") if num > pieces_left(row)
    end

    def pieces_left(row)
      @position[row - 1].select { |e| e }.size
    end

    def update_board(row, num)
      new_row = []
      (pieces_left(row) - num).times { new_row << true }
      @position[row - 1] = new_row
    end

    def winner?
      @position.flatten.count == 1
    end

  end

end
