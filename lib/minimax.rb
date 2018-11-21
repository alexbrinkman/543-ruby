module Game543

  class Minimax

    def initialize(board)
      @board = board
    end

    def search
      puts "Building tree..."
      root_node = MinimaxNode.new(@board).build_tree(@board)

      puts "Evaluating positions..."
      root_node = assign_node_values(root_node, :max)

      puts "Making best move..."
      root_node.moves.max { |a, b| a.value <=> b.value }.board
    end

    private

    def assign_node_values(root_node, max_min)
      root_node.moves.each do |node|
        if node.board.winner?
          node.value = value_of_win(max_min)
        else
          assign_node_values(node, flip_max_min(max_min))
          node.value = best_next_move(node, flip_max_min(max_min))[0]
        end
      end
      root_node
    end

    def best_next_move(node, min_max)
      best_move_value = node.moves.first.value
      best_move = node.moves.first
      node.moves.each do |move|
        if min_max == :max
          if move.value > best_move_value
            best_move_value = move.value
            best_move = move
          end
        else
          if move.value < best_move_value
            best_move_value = move.value
            best_move = move
          end
        end
      end
      [best_move_value, best_move]
    end

    def flip_max_min(max_min)
      max_min == :max ? :min : :max
    end

    def value_of_win(max_min)
      max_min == :max ? 1 : -1
    end

  end

end
