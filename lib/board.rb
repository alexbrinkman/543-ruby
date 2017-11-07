module Game543

  class Board

    def initialize
      @row1 = [true, true, true]
      @row2 = [true, true, true, true]
      @row3 = [true, true, true, true, true]
      @position = [@row1, @row2, @row3]
    end

    def to_s
      puts "---------"
      @position.each do |row|
        row.select { |e| e }.size.times { print "O " }
        puts "\n"
      end
      puts "---------"
    end

  end

end
