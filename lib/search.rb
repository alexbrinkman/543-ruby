module Game543

  class Search

    def initialize(board)
      @board = board
    end

    def get_move
      random_move
    end

    def random_move
      puts "Randomly choosing move..."
      available_moves = @board.available_moves
      random_move_index = rand(0..available_moves.size)
      available_moves[random_move_index]
    end

  end

end
