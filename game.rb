require 'yaml'
require_relative './city'
require_relative './player'

class Game
  #attr_reader :players, :pot, :deck
  attr_reader :current_time, :players, :cities

  def initialize(filename = '')
    unless filename == ''
      var = File.readlines(filename).join
      self.replace(YAML::load(var))
    else
      @current_time = Time.now
      @cities = City::get_default_cities
      @players = Player::prompt_user_for_player_info(@cities)
    end
  end

  def play
  	play_round until game_over?
  	game_over

    nil
  end

  def save
    saved_game = self.to_yaml
    File.open('saved_game.txt', 'w') do |f|
      f.puts(saved_game)
    end

    nil
  end

  def replace(data)
    vars = data.instance_variables

    vars.each do |var|
      value = data.instance_variable_get(var)
      self.instance_variable_set(var, value)
    end

    nil
  end

  private

  def play_round
    print_date
    # generate random cats jobs apts, from lists, random generator, job might be taken by player 1
  	#####@cities.each(&:shuffle)

    
    prompt_users_for_action
    increment_day
    calculate_income_and_expenses

    nil
  end

  def print_date
    puts "\nCurrent date is: #{@current_time.month}/#{@current_time.day}/#{@current_time.year}\n\n"
  
    nil
  end

  def game_over
    puts "the game is over"

    nil
  end

  def game_over?
    return true if @players.empty?
    # game over if anyone has more than 10 cats
    # this might need to be revised or make more difficult to afford cats

    @players.each do |player|
      return true if player.cats.length > 10
    end

    false
  end

  def prompt_users_for_action
    # do they want to take their cat for a walk if have one etc?
    @players.each do |player|
      player.prompt_user_for_action(self)
    end

    nil
  end

  def increment_day
    @current_time += 60 * 60 * 24

    nil
  end

  def calculate_income_and_expenses
    puts "CALCULATING INCOME AND EXPENSES NOT CREATED YET"

    nil
  end
end


# Do this if running $ ruby game.rb in command line
if __FILE__ == $PROGRAM_NAME
  puts "If you want to load from save game"
  puts "enter save file name, otherwise just press enter"
  filename = gets.chomp
  Game.new(filename).play
end