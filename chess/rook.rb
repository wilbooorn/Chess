require_relative 'sliding_piece'

class Rook < Piece
  attr_reader :value
  include SlidingPiece

  def initialize(color, pos, board)
    if color == :b
      @value = 9820.chr(Encoding::UTF_8)
    else
      @value = 9814.chr(Encoding::UTF_8)
    end
    super(color, pos, board)
  end

  def move_dirs
    [:horizontal]
  end
end
