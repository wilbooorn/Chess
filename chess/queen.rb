require_relative 'sliding_piece'

class Queen < Piece
  attr_reader :value
  include SlidingPiece

  def initialize(color, pos, board)
    if color == :b
      @value = 9819.chr(Encoding::UTF_8)
    else
      @value = 9813.chr(Encoding::UTF_8)
    end
    super(color, pos, board)
  end

  def move_dirs
    [:horizontal, :diagonal]
  end
end
