require './board.rb'
require './person.rb'
require './ai.rb'
require './tictactoe.rb'
auto = ARGV[0].downcase == "a" if ARGV[0]
game = TicTacToe.new(auto)