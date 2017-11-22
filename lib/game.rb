module Game543
  class Game

    def initialize
      @board = Board.new
      @whos_move = :player1
      run
    end

    def run
      puts @board
      loop do
        make_move
        if @board.winner?
          puts "#{@whos_move} wins!"
          exit
        end
        switch_players
      end
    end

    def make_move
      if @whos_move == :player1
        move = prompt_for_move
        begin
          @board.move(move[0], move[1])
        rescue ArgumentError => e
          puts e.message
        end
      else
        @board = Search.new(@board).get_move
      end
      puts @board
    end

    private

    def prompt_for_move
      puts "Your move: (row)"
      row = gets.chomp
      puts "Your move: (num)"
      num = gets.chomp
      [row, num]
    end

    def switch_players
      @whos_move = @whos_move == :player1 ? :player2 : :player1
    end

  end
end