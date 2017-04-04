require_relative 'stepping_piece'

class King < Piece
  attr_reader :value
  include SteppingPiece

  def initialize(color, pos, board)
    if color == :b
      @value = 9818.chr(Encoding::UTF_8)
    else
      @value = 9812.chr(Encoding::UTF_8)
    end
    super(color, pos, board)
  end
end
