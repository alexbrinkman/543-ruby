module Game543

  class MinimaxNode

    attr_accessor :board
    attr_accessor :moves
    attr_accessor :value

    def initialize(board)
      @board = board
      @moves = []
      @value = 0
    end

    def build_tree(board)
      root_node = MinimaxNode.new(board)
      board.available_moves.each do |b|
        root_node.moves << build_tree(b)
      end
      root_node
    end

  end

end
