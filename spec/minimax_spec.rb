require 'board'
require 'minimax'
require 'minimax_node'

module Game543
  RSpec.describe Minimax do
    describe "#search" do
      # I don't love comparing strings here to check equality of boards, but I think it's better
      # than changing the class to expose the board, when that's not needed except in testing.

      it "returns the known correct move for a given position" do
        initial_board = Board.new([[true, true, true], [true, true]])
        correct_move = Board.new([[true, true], [true, true]])
        returned_move = Minimax.new(initial_board).search
        expect(returned_move.to_s).to eq correct_move.to_s
      end

      it "returns the known correct move for a given position" do
        initial_board = Board.new([[true, true, true, true, true]])
        correct_move = Board.new([[true]])
        returned_move = Minimax.new(initial_board).search
        expect(returned_move.to_s).to eq correct_move.to_s
      end
    end

    describe "#winner?" do
      it "returns true if there is one piece left on the board" do
        expect(Board.new([[true]]).winner?).to be true
      end

      it "returns false if there is more than one piece left on the board" do
        expect(Board.new([[true, true]]).winner?).to be false
      end
    end
  end
end