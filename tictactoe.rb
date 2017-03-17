require './person.rb'
require './board.rb'

class TicTacToe
  def initialize
    clear
    puts "Player1: Enter your name."
    player1_name = gets.chomp

    clear
    puts "Player2: Enter your name."
    player2_name = gets.chomp

    clear
    @player1 = Person.new(1, player1_name)
    @player2 = Person.new(2, player2_name)

    @player_turn = 1
    @game_board = Board.new
    update
  end
  def clear
    system "clear" || "cls"
  end

  def get_player_input
    gets.chomp.strip.gsub(/\s+/, "_").downcase
  end

  def next_turn(turn_array, current_turn)
    current_turn < turn_array.length - 1 ? current_turn + 1 : 1
  end

  def update
    # main game loop
    loop do
      clear
      # update game board
      puts @game_board.to_s

      # game logic
      puts "#{Person.players[@player_turn]}, where do you want to put your piece? Enter 'help' to get a list of valid input options."
      begin
        player_input = get_player_input
        if Board.valid_input?(player_input)
          if player_input == "help"
            Board.help
            gets.chomp
            next
          else
            player_input = Board.valid_input[player_input.to_sym]
            if (@game_board.spot_taken?(player_input[0], player_input[1]))
              puts "Cell already taken!"
              puts "[PRESS ENTER]"
              gets.chomp
              next
            else
              @game_board.place_piece(@player_turn, player_input[0].to_i, player_input[1].to_i) 
            end
          end
        else
          raise "Error"
        end
      rescue
        puts "Please enter a valid command. Enter 'help' for a list of options you can use. "
        puts "[PRESS ENTER]"
        gets.chomp
        next
      end

      # check for victory
      if(@game_board.victory?)
        winner = @player_turn
        clear
        puts @game_board.to_s
        puts "=============="
        puts "= GAME OVER! ="
        puts "=============="
        puts "#{Person.players[winner]} wins!"
      else
        @player_turn = next_turn(Person.players, @player_turn)
        puts @player_turn
      end
      break if @game_board.victory?
    end
  end
end
game = TicTacToe.new

