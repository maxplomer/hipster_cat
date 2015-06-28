class Player

  def Player.prompt_user_for_player_info(cities)
    result = []

    puts "how many players are playing?"

    num_players = gets.chomp.to_i # if not valid input will just be zero and game over

    num_players.times do |i|
      puts "enter name and sex for player #{i + 1} (example: Joe male)"
      str = gets.chomp.split 
      result << Player.new(cities.first, str.first, str.last) # should be rescue loop 
    end

    result
  end

  attr_accessor :money, :location, :apartment
  attr_reader :name, :sex, :jobs, :cats

  def initialize(location, name, sex)
    @money = 10000
    @location = location
    @apartment = nil
    @name = name
    @sex = sex #leaving sex a user inputed string for now
    @jobs = []# make sure job schedules dont conflict
    @cats = []
  end

  def prompt_user_for_action
    puts "What do you want to do?"
    puts "options: adopt a cat, move"
    str = gets.chomp
    if str == "adopt a cat"
      puts "call the adopt a cat function" #implement might need city we are in
      adopt_a_cat
    elsif str == "move"
      puts "call the move function"
    else
      puts "Try again..."
      prompt_user_for_action
    end
  end

  def adopt_a_cat

  end

end