module Game543
  class Board

    def initialize(position = nil)
      @position = position || initial_board
    end

    def move(row, col, value)
      row = row.to_i
      col = col.to_i
      validate_move(row, col)
      update_board(row, col, value)
    end

    def winner?
      # Horizontal wins
      return true if @position[0][0] == "X" && @position[0][1] == "X" && @position[0][2] == "X"
      return true if @position[1][0] == "X" && @position[1][1] == "X" && @position[1][2] == "X"
      return true if @position[2][0] == "X" && @position[2][1] == "X" && @position[2][2] == "X"
      return true if @position[0][0] == "O" && @position[0][1] == "O" && @position[0][2] == "O"
      return true if @position[1][0] == "O" && @position[1][1] == "O" && @position[1][2] == "O"
      return true if @position[2][0] == "O" && @position[2][1] == "O" && @position[2][2] == "O"

      # Vertical wins
      return true if @position[0][0] == "X" && @position[1][0] == "X" && @position[2][0] == "X"
      return true if @position[0][1] == "X" && @position[1][1] == "X" && @position[2][1] == "X"
      return true if @position[0][2] == "X" && @position[1][2] == "X" && @position[2][2] == "X"
      return true if @position[0][0] == "O" && @position[1][0] == "O" && @position[2][0] == "O"
      return true if @position[0][1] == "O" && @position[1][1] == "O" && @position[2][1] == "O"
      return true if @position[0][2] == "O" && @position[1][2] == "O" && @position[2][2] == "O"

      # Diagonal wins
      return true if @position[0][0] == "O" && @position[1][1] == "O" && @position[2][2] == "O"
      return true if @position[0][0] == "X" && @position[1][1] == "X" && @position[2][2] == "X"
      return true if @position[0][2] == "O" && @position[1][1] == "O" && @position[2][0] == "O"
      return true if @position[0][2] == "X" && @position[1][1] == "X" && @position[2][0] == "X"
      false
    end

    def draw?
      @position.flatten.select { |p| p.nil? }.size.zero?
    end

    def available_moves(max_min)
      # One move for each open position on the board.
      piece = max_min == :max ? "X" : "O"
      boards = []
      @position.each_with_index do |row, row_index|
        row.each_with_index do |col, col_index|
          next unless col.nil?
          new_position = Marshal.load(Marshal.dump(@position)) # Duplicate the object
          new_position[row_index][col_index] = piece
          boards << Board.new(new_position)
        end
      end
      boards
    end

    def to_s
      str = ""
      str << "---------\n"
      @position.each_with_index do |row, index|
        str << "row #{index + 1}: "
        row.each do |cell|
          tmp_str = cell.nil? ? "." : cell
          str << tmp_str + " "
        end
        str << "\n"
      end
      str << "---------"
      str
    end

    private

    def validate_move(row, col)
      raise ArgumentError.new("Invalid row: please enter 1-3.") if row < 1 || row > 3
      raise ArgumentError.new("Invalid col: please enter 1-3.") if col < 1 || col > 3
      raise ArgumentError.new("Invalid move: that cell has already been taken.") if cell_taken?(row, col)
    end

    def cell_taken?(row, col)
      !@position[row -1][col - 1].nil?
    end

    def pieces_left_in_row(row)
      @position[row - 1].select { |e| e }.size
    end

    def total_pieces_left
      @position.flatten.count
    end

    def one_row_left?
      @position.size.times do |row|
        return true if pieces_left_in_row(row + 1) == total_pieces_left
      end
      false
    end

    def update_board(row, col, value)
      @position[row - 1][col - 1] = value
    end

    def create_row(pieces)
      row = []
      pieces.times { row << true }
      row
    end

    def initial_board
      [
        [nil, nil, nil],
        [nil, nil, nil],
        [nil, nil, nil]
      ]
    end

  end
end
