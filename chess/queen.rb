require_relative 'sliding_piece'

class Queen < Piece
  attr_reader :value
  include SlidingPiece

  def initialize(color, pos, board)
    @value = "Q"
    super(color, pos, board)
  end

  def move_dirs
    [:horizontal, :diagonal]
  end
end
