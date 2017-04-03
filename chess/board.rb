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
    @grid = Array.new(8) { Array.new(8) { NullPiece.new(nil) } }
    @grid[1].map! do |spot|
      spot = Pawn.new(:b)
    end
    @grid[6].map! do |spot|
      spot = Pawn.new(:w)
    end
    self[[0, 0]], self[[0, 7]] = Rook.new(:b), Rook.new(:b)
    self[[0, 1]], self[[0, 6]] = Knight.new(:b), Knight.new(:b)
    self[[0, 2]], self[[0, 5]] = Bishop.new(:b), Bishop.new(:b)
    self[[0, 3]], self[[7, 3]] = Queen.new(:b), Queen.new(:w)
    self[[0, 4]], self[[7, 4]] = King.new(:b), King.new(:w)
    self[[7, 0]], self[[7, 7]] = Rook.new(:w), Rook.new(:w)
    self[[7, 1]], self[[7, 6]] = Knight.new(:w), Knight.new(:w)
    self[[7, 2]], self[[7, 5]] = Bishop.new(:w), Bishop.new(:w)

  end

  def move_piece(start_pos, end_pos)
    raise "empty start" if self[start_pos].is_a?(NullPiece)
    raise "invalid move" unless self[start_pos].valid_move?
    temp = self[start_pos]
    self[start_pos] = NullPiece.new(nil)
    self[end_pos] = temp
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
