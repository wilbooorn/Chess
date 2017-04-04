require_relative 'stepping_piece'

class King < Piece
  attr_reader :value
  include SteppingPiece

  def initialize(color, pos, board)
    @value = "K"
    super(color, pos, board)
  end
end
