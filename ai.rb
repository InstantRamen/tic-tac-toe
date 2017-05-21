require './person.rb'

class AI < Person
  def decide_input(game_board)
    @game_board = game_board
    rand_cell
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
end