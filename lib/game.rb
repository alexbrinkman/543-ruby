module Game543
  class Game

    def initialize
      @board = Board.new
      @whos_move = :human
      run
    end

    private

    def run
      puts @board
      loop do
        make_move
        if @board.winner?
          puts "#{@whos_move.capitalize} wins!"
          exit
        elsif @board.draw?
          puts "It's a draw."
          exit
        end
        switch_players
      end
    end

    def make_move
      if @whos_move == :human
        move = prompt_for_move
        begin
          @board.move(move[0], move[1], "O")
        rescue ArgumentError => e
          puts e.message
        end
      else
        @board = Minimax.new(@board).search
      end
      puts @board
    end

    def prompt_for_move
      puts "Your move: (row)"
      row = gets.chomp
      puts "Your move: (col)"
      col = gets.chomp
      [row, col]
    end

    def switch_players
      @whos_move = @whos_move == :human ? :computer : :human
    end

  end
end
