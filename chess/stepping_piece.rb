module SteppingPiece

  KNIGHT_DIRS = [[-2, -1], [-2, +1], [2, 1], [2, -1],
                 [1, -2], [-1, -2], [1, 2], [-1, 2]]
  KING_DIRS = [[1, 1], [1, -1], [-1, 1], [-1, -1],
               [0, 1], [0, -1], [-1, 0], [1, 0]]


  def moves
    possible_moves = []
    if self.is_a?(Knight)
      KNIGHT_DIRS.each do |dir|
        possible_moves << [self.pos[0] + dir[0], self.pos[1] + dir[1]]
      end
    else
      KING_DIRS.each do |dir|
        possible_moves << [self.pos[0] + dir[0], self.pos[1] + dir[1]]
      end
    end
    possible_moves.select { |move| valid_move?(move) }
  end

  def valid_move?(move)
    move[0].between?(0, 7) && move[1].between?(0, 7) &&
    self.board[move].color != self.color
  end
end
