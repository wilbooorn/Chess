require_relative 'piece'
require_relative 'bishop'
require_relative 'knight'
require_relative 'rook'
require_relative 'pawn'
require_relative 'null_piece'
require_relative 'king'
require_relative 'queen'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.instance } }
    @grid[1].map!.with_index do |_, i|
      Pawn.new(:b, [1, i], self)
    end
    @grid[6].map!.with_index do |_, i|
      Pawn.new(:w, [6, i], self)
    end
    self[[0, 0]], self[[0, 7]] = Rook.new(:b, [0, 0], self), Rook.new(:b, [0, 7], self)
    self[[0, 1]], self[[0, 6]] = Knight.new(:b, [0, 1], self), Knight.new(:b, [0, 6], self)
    self[[0, 2]], self[[0, 5]] = Bishop.new(:b, [0, 2], self), Bishop.new(:b, [0, 5], self)
    self[[0, 3]], self[[7, 3]] = Queen.new(:b, [0, 3], self), Queen.new(:w, [7, 3], self)
    self[[0, 4]], self[[7, 4]] = King.new(:b, [0, 4], self), King.new(:w, [7, 4], self)
    self[[7, 0]], self[[7, 7]] = Rook.new(:w, [7, 0], self), Rook.new(:w, [7, 7], self)
    self[[7, 1]], self[[7, 6]] = Knight.new(:w, [7, 1], self), Knight.new(:w, [7, 6], self)
    self[[7, 2]], self[[7, 5]] = Bishop.new(:w, [7, 2], self), Bishop.new(:w, [7, 5], self)

  end

  def move_piece(start_pos, end_pos)
    raise "empty start" if self[start_pos].is_a?(NullPiece)
    raise "invalid move" unless self[start_pos].moves.include?(end_pos)
    temp = self[start_pos]
    self[start_pos] = NullPiece.instance
    self[end_pos] = temp
    self[end_pos].pos = end_pos
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

end

b = Board.new
p b.grid
