require_relative 'sliding_piece'

class Bishop < Piece
  attr_reader :value
  include SlidingPiece

  def initialize(color, pos, board)
    @value = "B"
    super(color, pos, board)
  end

  def move_dirs
    [:diagonal]
  end
end
