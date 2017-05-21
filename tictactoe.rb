class TicTacToe

  # override gets to use STDIN
  # without this, ARGV doesn't work
  def gets
    STDIN.gets
  end

  def initialize(auto = false)
    clear

    @players = []
    @player_info = [
      {id: 1, name: "Player", ai?: false},
      {id: 2, name: "AI", ai?: true}
    ]

    setup if auto

    puts "Player1: Enter your name."
    @player_info[0][:name] = gets.chomp
    puts "#{@player_info[0][:name]}: Is this player an AI? (Y/N)"
    @player_info[0][:ai?] = gets.chomp.downcase == "y"
    clear

    puts "Player2: Enter your name."
    @player_info[1][:name] = gets.chomp
    puts "#{@player_info[0][:name]} Is this player an AI? (Y/N)"
    @player_info[1][:ai?] = gets.chomp.downcase == "y"

    setup
  end


  def setup(player_info = @player_info)
    clear

    @player1 = create_player(player_info[0])
    @player2 = create_player(player_info[1])

    @player_turn = 1
    @game_board = Board.new
    update
  end

  def create_player(player)
    if player[:ai?]
      AI.new(player[:id], player[:name])
    else
      Person.new(player[:id], player[:name])
    end
  end

  def clear
    system "clear" || "cls"
  end

  def next_turn(turn_array, current_turn)
    current_turn < turn_array.length - 1 ? current_turn + 1 : 1
  end

  def play_again?
    puts "Would you like to play again? (y/n)"
    answer = gets.chomp.downcase
    answer == "y" || answer == "yes"
  end

  def quit?
    puts "Would you really like to quit the game? (y/n)"
    answer = gets.chomp.downcase
    answer == "y" || answer == "yes"
  end

  def update
    # main game loop
    loop do
      clear
      # update game board
      puts @game_board.to_s

      # game logic
      current_player = Person.players[@player_turn]
      puts "#{current_player.name}, where do you want to put your piece? Enter 'help' to get a list of valid input options."
      begin
        # get player input
        player_input = current_player.decide_input(@game_board)

        # handle player input
        if Board.valid_input?(player_input)
          puts "#{player_input[1]} valid"

          if player_input == "help"
            Board.help
            gets.chomp
            next
          elsif player_input == "exit"
            if quit?
              break
            else
              next
            end
          else
            player_input = Board.valid_input[player_input.to_sym] unless current_player.is_a?(AI)
            puts player_input
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
        puts "===>WINNER<==="
        puts "#{Person.players[winner].name} wins!"
        if play_again?
          setup
        else
          break
        end
      elsif @game_board.draw?
        clear
        puts @game_board.to_s
        puts "=============="
        puts "= GAME OVER! ="
        puts "====>DRAW<===="
        if play_again?
          setup
        else
          break
        end
      else
        @player_turn = next_turn(Person.players, @player_turn)
        puts @player_turn
      end
      break if @game_board.victory?
    end
  end
end
