class Player

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