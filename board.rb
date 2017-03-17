class Board
  attr_reader :board, :size

  @@free_cells = 0

  @@valid_input = {
    top_left:      [0,0],
    top_center:    [0,1],
    top_right:     [0,2],
    mid_left:      [1,0],
    mid_center:    [1,1],
    mid_right:     [1,2],
    low_left:      [2,0],
    low_center:    [2,1],
    low_right:     [2,2],
    topleft:       [0,0],
    topcenter:     [0,1],
    topright:      [0,2],
    midleft:       [1,0],
    midcenter:     [1,1],
    midright:      [1,2],
    lowleft:       [2,0],
    lowcenter:     [2,1],
    lowright:      [2,2],
    lowerleft:     [2,0],
    lowercenter:   [2,1],
    lowerright:    [2,2],
    bottomleft:    [2,0],
    bottomcenter:  [2,1],
    bottomright:   [2,2],
    lower_left:     [2,0],
    lower_center:   [2,1],
    lower_right:    [2,2],
    bottom_left:    [2,0],
    bottom_center:  [2,1],
    bottom_right:   [2,2],
    help:          "help",
    exit:          "exit"
  }
  def initialize
    @board = create_board
    @pieces = [" ", "X", "O"] 
  end

  public

  def place_piece(player_id, x, y)
    @@free_cells -= 1
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

  def draw?
    @@free_cells == 0
  end

  def victory?
    # VICTORY CONDITIONS:
    # if any row is all 1 or 2
    horizontals = @board

    verticals = [[@board[0][0], @board[1][0], @board[2][0]],
                 [@board[0][1], @board[1][1], @board[2][1]],
                 [@board[0][2], @board[1][2], @board[2][2]]]

    diagonals = [[@board[0][0], @board[1][1], @board[2][2]],
                 [@board[0][2], @board[1][1], @board[2][0]]]

    # check matches
    return matches?(horizontals) ||
           matches?(verticals)   ||
           matches?(diagonals)
  end

  private

  def create_board
    @@free_cells = 9
    @board = [[0,0,0],
              [0,0,0],
              [0,0,0]]
  end

  def matches?(row_arr)
    row_arr.each do |arr|
      if arr.any? {|id| id == 0} 
        next
      else
        return true if arr.all? {|id| id == 1} || arr.all? {|id| id == 2}
      end
    end
    false
  end

  public

  def self.valid_input
    @@valid_input
  end

  def self.help
    @@valid_input.each do |key, value|
      puts "#{key}"
    end
    puts "[PRESS ENTER]"
  end

  def self.valid_input?(input)
    true
  end
end