require './board.rb'

class Person
  attr_reader :id, :name
  
  @@person_count  = 0
  @@people = []

  def initialize(id = 1, name = nil)
    id > 0 ? @id = id : id = 1
    @name = name
    @@person_count += 1
    @@people[id] = self
  end

  public 

  def decide_input(game_board = [])
    puts "Player:"
    gets.chomp.strip.gsub(/\s+/, "_").downcase
  end
  
  def self.player_count
    @@player_count
  end

  def self.players
    @@people
  end
end