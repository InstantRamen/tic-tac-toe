require './person.rb'
require './board.rb'
require 'pp'


def clear
  system "clear" || "cls"
end

def get_player_input
  gets.chomp.strip.gsub(/\s+/, "_").downcase
end


clear
puts "Player1: Enter your name."
player1_name = gets.chomp
clear
puts "Player2: Enter your name."
player2_name = gets.chomp
clear
player1 = Person.new(1, player1_name)
player2 = Person.new(2, player2_name)

player_turn = 1
game_board = Board.new

# main game loop
loop do
  clear
  # update game board
  puts game_board.to_s

  # game logic
  puts "#{Person.players[player_turn]}, where do you want to put your piece? Enter 'help' to get a list of valid input options."
  begin
    player_input = get_player_input
    if Board.valid_input?(player_input)
      if player_input == "help"
        Board.help
        gets.chomp
        next
      else
        player_input = Board.valid_input[player_input.to_sym]
        if (game_board.spot_taken?(player_input[0], player_input[1]))
          puts "Cell already taken!"
          gets.chomp
          next
        else
          game_board.place_piece(player_turn, player_input[0].to_i, player_input[1].to_i) 
        end
      end
    else
      raise "Error"
    end
  rescue
    puts "Please enter a valid command. Enter 'help' for a list of options you can use. "
    gets.chomp
    next
  end
  if(game_board.victory?)
    winner = player_turn
  else
    player_turn = player_turn < Person.players.length - 1 ? player_turn + 1 : 1
    puts player_turn
  end
  break if game_board.victory?
end

