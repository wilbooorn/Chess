class Pawn < Piece
  attr_reader :value


  def initialize(color, pos, board)
    if color == :b
      @value = 9823.chr(Encoding::UTF_8)
    else
      @value = 9817.chr(Encoding::UTF_8)
    end
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

    possible_moves = possible_moves.select { |move| valid_move?(move) }

    if color == :w
      x = [pos[0] - 1, pos[1] + 1]
      y = [pos[0] - 1, pos[1] - 1]

      possible_moves << x if in_bounds?(x) && self.board[x].color == :b
      possible_moves << y if in_bounds?(y) && self.board[y].color == :b
    else
      x = [pos[0] + 1, pos[1] + 1]
      y = [pos[0] + 1, pos[1] - 1]

      possible_moves << x if in_bounds?(x) && self.board[x].color == :w
      possible_moves << y if in_bounds?(y) && self.board[y].color == :w
    end
    possible_moves
  end

  def in_bounds?(move)
    move[0].between?(0, 7) && move[1].between?(0, 7)
  end

  def valid_move?(move)
    in_bounds?(move) && self.board[move].is_a?(NullPiece)
  end

end
