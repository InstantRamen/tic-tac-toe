require('./person.rb')
require('./board.rb')

player1 = Person.new(1, "Derrick")
player2 = Person.new(2, "Elena")

game_board = Board.new
game_board.place_piece(player1.id, 0, 0)

puts game_board.to_s
