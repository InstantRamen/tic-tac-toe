class Board
  attr_reader :board, :size

  def initialize
    @size = 3
    @board = create_board
  end

  public

  def place_piece(player_id, x, y)
    @board[x][y] = player_id
  end

  def to_s
    result = ""
    @board.each do |x|
      result += "#{x[0]} | #{x[1]} | #{x[2]} \n"
    end
    result
  end

  private

  def create_board
    # HACK: change this to use a size parameter in initialize
    @board = [[0,0,0],
              [0,0,0],
              [0,0,0]]
  end
end