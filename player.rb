class Player

  def Player.prompt_user_for_player_info
    result = []

    puts "how many players are playing?"

    #should be rescue loop for all gets
    num_players = gets.chomp

    num_player.times do |i|
      puts "enter name and sex for player #{i + 1} (example: Joe male)"
      str = gets.chomp.split
      result << Player.new(str.first, str.last)
    end

    result
  end

  attr_accessor :money, :location, :apartment
  attr_reader :name, :sex, :jobs, :cats

  def initialize(name, sex)
    @money = 10000
    @location = 'suburbs'
    @apartment = nil
    @name = name
    @sex = sex #leaving sex a user inputed string for now
    @jobs = []# make sure job schedules dont conflict
    @cats = []
  end

end