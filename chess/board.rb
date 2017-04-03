class Board

  def intialize
    @grid = Array.new(8) { Array.new(8) { Piece.new } }
  end

end
