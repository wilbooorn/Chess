class Rook < Piece
  attr_reader :value
  
  def initialize(color)
    @value = "R"
    super(color)
  end
end
