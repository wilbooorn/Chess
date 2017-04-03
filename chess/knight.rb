class Knight < Piece
  attr_reader :value

  def initialize(color)
    @value = "N"
    super(color)
  end
end
