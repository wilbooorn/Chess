module SlidingPiece
  DIAGS = [[-1, -1], [-1, +1], [1, 1], [1, -1]]
  HORIZ = [[1, 0], [-1, 0], [0, 1], [0, -1]]

  def moves
    possible_moves = []
    if self.move_dirs.include?(:horizontal)
      HORIZ.each { |dir| possible_moves += slide(dir) }
    end
    if self.move_dirs.include?(:diagonal)
      DIAGS.each { |dir| possible_moves += slide(dir) }
    end
    possible_moves
  end

  private

  def opposite_color
    self.color == :b ? :w : :b
  end

  def slide(diff)
    moves = []
    pos_x, pos_y = self.pos
    loop do
      pos_x += diff[0]
      pos_y += diff[1]
      return moves if !pos_x.between?(0, 7) || !pos_y.between?(0, 7) ||
      self.board[[pos_x, pos_y]].color == self.color
      moves << [pos_x, pos_y]
      return moves if self.board[[pos_x, pos_y]].color == opposite_color
    end
  end
end
