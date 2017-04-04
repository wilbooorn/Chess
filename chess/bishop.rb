require_relative 'sliding_piece'

class Bishop < Piece
  attr_reader :value
  include SlidingPiece

  def initialize(color, pos, board)
    if color == :b
      @value = 9821.chr(Encoding::UTF_8)
    else
      @value = 9815.chr(Encoding::UTF_8)
    end
    super(color, pos, board)
  end

  def move_dirs
    [:diagonal]
  end
end
