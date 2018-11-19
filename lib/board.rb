module Game543
  class Board

    # Assume the first row is FIRST_ROW_SIZE pieces, increasing 1 piece for each row.
    FIRST_ROW_SIZE = 3
    NUM_ROWS = 3

    def initialize(position = nil)
      @position = position || generate_board
    end

    def move(row, num)
      row = row.to_i
      num = num.to_i
      validate_move(row, num)
      update_board(row, num)
    end

    def winner?
      total_pieces_left == 1
    end

    def available_moves
      # One move for each piece of each row, unless there are only pieces left in one row.
      boards = []
      start_at = one_row_left? ? 1 : 0
      @position.each_with_index do |row, index|
        (start_at..row.size - 1).each do |i|
          new_position = @position.dup
          new_position[index] = create_row(i)
          boards << Board.new(new_position)
        end
      end
      boards
    end

    def to_s
      str = ""
      str << "---------\n"
      @position.each do |row|
        row.select { |e| e }.size.times { str << "O " }
        str << "\n"
      end
      str << "---------"
      str
    end

    private

    def validate_move(row, num)
      raise ArgumentError.new("Invalid row: please enter 1-#{NUM_ROWS}") if row < 1 || row > NUM_ROWS
      raise ArgumentError.new("Invalid num: please enter at least 1 piece") if num < 1
      raise ArgumentError.new("Invalid num: please enter no more than the number remaining in the row") if num > pieces_left_in_row(row)
      raise ArgumentError.new("Invalid num: you may not take all remaining pieces") if num >= total_pieces_left
    end

    def pieces_left_in_row(row)
      @position[row - 1].select { |e| e }.size
    end

    def total_pieces_left
      @position.flatten.count
    end

    def one_row_left?
      NUM_ROWS.times do |row|
        return true if pieces_left_in_row(row + 1) == total_pieces_left
      end
      false
    end

    def update_board(row, num)
      new_row = []
      (pieces_left_in_row(row) - num).times { new_row << true }
      @position[row - 1] = new_row
    end

    def create_row(pieces)
      row = []
      pieces.times { row << true }
      row
    end

    def generate_board
      array = []
      NUM_ROWS.times do |size|
        array << Array.new(FIRST_ROW_SIZE + size) { true }
      end
      array
    end

  end
end
