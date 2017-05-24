require './person.rb'
require './board.rb'

class AI < Person

  def decide_input(game_board)
    @game_board = game_board
    tmp_board = game_board
    minimax_old(tmp_board)
  end

  def rand_cell
    cell = [rand(0..2), rand(0..2)]
    if @game_board.spot_taken?(cell[0], cell[1])
      puts "taken!"
      rand_cell
    else
      cell
    end
  end

  def minimax(board)
    points = 0
    board.each_free do |i|
      puts i
    end
  end

  def minimax_old(board)
    points = 0
    board.board.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        begin
          if points > 0
            return [row_index, col_index]
          end
          if attempt_piece_place(row_index, col_index, board)
            return [row_index, col_index]
          end
        rescue
          next
        end
      end
    end
  end


  def attempt_piece_place(row, col, board)
    if board.spot_taken?(row, col)
      raise "Error"
    else
      true
    end
  end
  def minimax_recursive(board)
    # base case: points equals 10 or there are no more spaces left and the space won't cause the other player to win
    points = 0

  end
end