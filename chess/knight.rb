require_relative 'stepping_piece'

class Knight < Piece
  include SteppingPiece

  attr_reader :value

  def initialize(color, pos, board)
    @value = "N"
    super(color, pos, board)
  end
end
