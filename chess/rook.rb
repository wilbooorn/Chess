require_relative 'sliding_piece'

class Rook < Piece
  attr_reader :value
  include SlidingPiece

  def initialize(color, pos, board)
    @value = "R"
    super(color, pos, board)
  end

  def move_dirs
    [:horizontal]
  end
end
