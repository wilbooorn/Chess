class Piece
  attr_reader :color
  attr_accessor :pos, :board

  def initialize(color, pos, board)
    @color, @pos, @board = color, pos, board
  end

  def to_s
    p @board[@pos] == self
  end

  def other_color
    @color == :w ? :b : :w
  end

  # def moves
  # end


end
