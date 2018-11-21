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
        end
        switch_players
      end
    end

    def make_move
      if @whos_move == :human
        move = prompt_for_move
        begin
          @board.move(move[0], move[1])
        rescue ArgumentError => e
          puts e.message
        end
      else
        @board = Search.new(@board).find_move
      end
      puts @board
    end

    def prompt_for_move
      puts "Your move: (row)"
      row = gets.chomp
      puts "Your move: (num)"
      num = gets.chomp
      [row, num]
    end

    def switch_players
      @whos_move = @whos_move == :human ? :computer : :human
    end

  end
end
