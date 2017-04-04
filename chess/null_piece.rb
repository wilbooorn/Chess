require 'singleton'
class NullPiece < Piece
  attr_reader :value
  include Singleton

  def initialize
    @value = "-"
    super(nil, [nil, nil], nil)
  end
end
