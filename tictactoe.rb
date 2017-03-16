require('./person.rb')
require('./board.rb')

# player1 = Player.new(1, "Derrick")
# player2 = Player.new(2, "Elena")

game_board = Board.new(3)
puts game_board.to_s
# loop do
#   # Main game loop
#   break if true # I don't want to loop now. I'll change this later
# end