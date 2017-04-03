class King < Piece
  attr_reader :value

  def initialize(color)
    @value = "K"
    super(color)
  end
end
