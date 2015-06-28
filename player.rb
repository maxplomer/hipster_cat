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

  def prompt_user_for_action(cities)
    puts "What do you want to do?"
    puts "options: adopt a cat, move, get a job, save game" #go to sleep?
    command = gets.chomp

    case command
    when "adopt a cat"
      puts "Calling the adopt a cat function...."
      adopt_a_cat
    when "move"
      puts "call the move function"
      move(cities)
    when "get a job"
      puts "call the get a job function"
      get_a_job
    when "save game"
      puts "calling the save game method, hasn't been created yet"
    else
      puts "Try again..."
      prompt_user_for_action
    end
  end

  def adopt_a_cat
    max_cats = @location.cats.length
    if max_cats == 0
      puts "There are no cats to adopt"
      return
    end

    puts "There are the following cats in #{@location.name}"
    puts "(Note: each cat cost $1 per day)"
    @location.cats.each_with_index do |cat, index|
      puts "Cat #{index + 1}: #{cat.name} #{cat.age} #{cat.sex} #{cat.color}" 
    end

    puts "Input a cat number 1-#{max_cats}"
    cat_number = gets.chomp.to_i

    if (cat_number.is_a? Numeric) && cat_number.between?(1, max_cats)
      self.cats << @location.cats.delete_at(cat_number - 1)
      puts "Congrats you adopted #{self.cats.last.name}"
      puts "Your currently have #{self.cats.length} cats"
    else
      puts "You messed up adopting a cat"
    end
  end

  def get_a_job
    max_jobs = @location.jobs.length

    if max_jobs == 0
      puts "There are no jobs to get"
      return
    end

    puts "There are the following jobs in #{@location.name}"
    #going to need to implemenet apartments and jobs because need to make money
    #before moving, 

    @location.jobs.each_with_index do |job, index|
      puts "Job #{index + 1}: #{job.position} at #{job.company}" 
    end

    puts "Input a job number 1-#{max_jobs}"
    job_number = gets.chomp.to_i

    if (job_number.is_a? Numeric) && job_number.between?(1, max_jobs)
      self.jobs << @location.jobs.delete_at(job_number - 1)
      puts "Congrats you got the job #{self.jobs.last.position} at #{self.jobs.last.company}"
      puts "Your currently have #{self.jobs.length} job#{'s' if self.jobs.length != 1}"
    else
      puts "You messed up getting a job"
    end

  end

  def move
    #clear jobs and apartments, keep cats with you
  end

end