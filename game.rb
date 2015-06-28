require 'yaml'
require_relative './city'
require_relative './player'

class Game
  #attr_reader :players, :pot, :deck
  attr_reader :current_time, :players, :cities

  def initialize(filename = '')
    unless filename == ''
      #var = File.readlines(filename).join
      #@board = YAML::load(var)
    else
      @current_time = Time.now
      @players = Player::prompt_user_for_player_info
      @cities = City::get_default_cities
    end
  end

  def play
  	play_round until game_over?
    p @players
    p @cities
  	game_over
  end

  def play_round
    # generate random cats jobs apts, from lists, random generator, job might be taken by player 1
  	#####@cities.each(&:shuffle)

    # do they want to take their cat for a walk if have one etc?
    @players.each(&:prompt_user_for_action)

    #####end_round
  end


  def game_over
    puts "the game is over"
  end

  def game_over?
    # game over if anyone has more than 10 cats
    
    @player.each do |player|
      return true if player.cats.length > 10
    end

    false
  end


end


# Do this if running $ ruby game.rb in command line
if __FILE__ == $PROGRAM_NAME
  puts "If you want to load from save game"
  puts "enter save file name, otherwise just press enter"
  filename = gets.chomp
  Game.new(filename).play
end