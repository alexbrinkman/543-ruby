module Game543

  class MinimaxNode

    attr_accessor :board
    attr_accessor :moves
    attr_accessor :value

    def initialize(board)
      @board = board
      @moves = [] # Array of MinimaxNodes
      @value = 0
    end

  end

end
