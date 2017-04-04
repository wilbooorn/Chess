class Pawn < Piece
  attr_reader :value


  def initialize(color, pos, board)
    @value = "P"
    super(color, pos, board)
    @moved = false
  end

  def moves
    possible_moves = []

    if color == :w
     possible_moves << [pos[0] - 1, pos[1]]
     possible_moves << [pos[0] - 2, pos[1]] unless @moved
    else
      possible_moves << [pos[0] + 1, pos[1]]
      possible_moves << [pos[0] + 2, pos[1]] unless @moved
    end

    possible_moves.select { |move| valid_move?(move) }

    if color == :w
     possible_moves << [pos[0] - 1, pos[1]+1] if self.board[[pos[0] - 1, pos[1]+1]].color == :b
     possible_moves << [pos[0] - 1, pos[1]-1] if self.board[[pos[0] - 1, pos[1]-1]].color == :b
    else
      possible_moves << [pos[0] + 1, pos[1]+1] if self.board[[pos[0] + 1, pos[1]+1]].color == :w
      possible_moves << [pos[0] + 1, pos[1]-1] if self.board[[pos[0] + 1, pos[1]-1]].color == :w
    end
    possible_moves
  end

  def valid_move?(move)
    move[0].between?(0, 7) && move[1].between?(0, 7) &&
      self.board[move].is_a?(NullPiece)
  end

end
