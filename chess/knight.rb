require_relative 'stepping_piece'

class Knight < Piece
  include SteppingPiece

  attr_reader :value

  def initialize(color, pos, board)
    if color == :b
      @value = 9822.chr(Encoding::UTF_8)
    else
      @value = 9816.chr(Encoding::UTF_8)
    end
    super(color, pos, board)
  end
end
