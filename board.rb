class Board
  attr_reader :board

  def initialize(size = 3)
    @size = size
    @board = create_board
  end

  public

  def to_s
    @board.each do |x|
      @board[x].each do |y|
        puts @board.to_s
      end
    end
  end

  private

  def create_board
    # [[x,y,player_id]]
    board = []
    @size.times do |x|
      @size.times do |y|
        board.push([x, y, 0])
      end
    end
    board
  end
end