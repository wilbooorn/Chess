class NullPiece < Piece
  attr_reader :value

  def initialize(color)
    @value = "-"
    super(color)
  end
end
