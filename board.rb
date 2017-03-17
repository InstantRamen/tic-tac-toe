class Board
  attr_reader :board, :size

  @@valid_input = {
    top_left:   [0,0],
    top_center: [0,1],
    top_right:  [0,2],
    mid_left:   [1,0],
    mid_center: [1,1],
    mid_right:  [1,2],
    low_left:   [2,0],
    low_center: [2,1],
    low_right:  [2,2],
    topleft:    [0,0],
    topcenter:  [0,1],
    topright:   [0,2],
    midleft:    [1,0],
    midcenter:  [1,1],
    midright:   [1,2],
    lowleft:    [2,0],
    lowcenter:  [2,1],
    lowright:   [2,2],
    help:       "help"
  }
  def initialize
    @board = create_board
    @pieces = ["N", "X", "O"] 
  end

  public

  def place_piece(player_id, x, y)
    @board[x][y] = player_id
  end

  def spot_taken?(x, y)
    @board[x][y] != 0
  end

  def to_s
    result = ""
    @board.each_with_index do |x, i|
      result += "   |   |   \n"\
                " #{@pieces[x[0]]} | #{@pieces[x[1]]} | #{@pieces[x[2]]} \n"
      result += i == 2 ? "   |   |    \n" : "___|___|___ \n"

      
    end
    result
  end

  def victory?
    false
  end

  private

  def create_board
    @board = [[0,0,0],
              [0,0,0],
              [0,0,0]]
  end

  public

  def self.valid_input
    @@valid_input
  end

  def self.help
    @@valid_input.each do |key, value|
      puts "#{key}"
      puts "[PRESS ENTER]"
    end
  end

  def self.valid_input?(input)
    true
  end
end