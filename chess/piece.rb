class Piece
  attr_reader :color
  attr_accessor :pos, :board

  def initialize(color, pos, board)
    @color, @pos, @board = color, pos, board
  end

  def move
  end

end
