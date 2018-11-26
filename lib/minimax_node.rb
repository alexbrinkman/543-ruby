module Game543

  class MinimaxNode

    MAX_DEPTH = 7

    attr_accessor :board
    attr_accessor :moves
    attr_accessor :value

    def initialize(board)
      @board = board
      @moves = [] # Array of MinimaxNodes
      @value = 0
    end

    def build_tree(board, depth=0)
      root_node = MinimaxNode.new(board)
      return root_node if depth > MAX_DEPTH
      board.available_moves.each do |b|
        root_node.moves << build_tree(b, depth + 1)
      end
      root_node
    end

  end

end
