module Game543

  class Minimax

    def initialize(board)
      @board = board
    end

    def search
      tree = MinimaxNode.new(@board).build_tree(@board)
      tree.moves.first.board
    end

  end

end
