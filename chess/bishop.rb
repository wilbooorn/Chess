class Bishop < Piece
  attr_reader :value

  def initialize(color)
    @value = "B"
    super(color)
  end
end
