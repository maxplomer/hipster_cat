class Game
  attr_reader :players, :pot, :deck

  def initialize
  	@players = []
  	@cities = []
  end



  def play
  	play_round until game_over?
  	game_over
  end

  def play_round
  	@cities.each do |city|


    # generate random cats jobs apts, from lists, random generator, job might be taken by player 1
    @city.shuffle 
    # do they want to take their cat for a walk if have one etc?
    @players.each do |player|
      prompt_user_for_action(player) 
    end
    end_round
  end


  def game_over
    puts "the game is over"
  end


end