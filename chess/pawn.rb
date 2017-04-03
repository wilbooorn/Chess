class Pawn < Piece
  attr_reader :value

  def initialize(color)
    @value = "P"
    super(color)
  end
end
