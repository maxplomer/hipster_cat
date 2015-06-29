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

  def prompt_user_for_action(game)
    #print out cat/job/city/apartment info
    puts "Hey #{self.name}, what do you want to do today?"
    puts "options: adopt a cat, take cat for walk, move, get a job, save game"
    command = gets.chomp

    case command
    when "adopt a cat"
      adopt_a_cat
    when "take cat for walk"
      take_cat_for_walk
    when "move"
      move(game.cities)
    when "get a job"
      get_a_job
    when "save game"
      game.save
    else
      puts "Try again..."
      prompt_user_for_action(game)
    end
  end

  private

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
      cat_name = @location.cats[cat_number - 1].name

      passed_test = give_user_cat_test(cat_name)
      if passed_test
        self.cats << @location.cats.delete_at(cat_number - 1)
        puts "Congrats you adopted #{self.cats.last.name}"
        puts "Your currently have #{self.cats.length} cats"
      else
        puts "Sorry you just dont love #{cat_name} enough."
      end
    else
      puts "You messed up adopting a cat"
    end
  end

  def give_user_cat_test(cat_name)
    sum = cat_name.gsub(' ','').chars.map(&:my_ord).inject(:+)
    puts "To show your love for #{cat_name}, please sum the number of each letter that corresponds to its order in the alphabet"
    puts "(for example:  Sam   becomes   19 + 1 + 13 = 33 )"
    inputted_sum = gets.chomp.to_i
    sum == inputted_sum
  end

  def take_cat_for_walk
    puts "TAKING CAT FOR WALK NOT COMPLETED YET"
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
      passed_test = give_user_job_test
      if passed_test
        self.jobs << @location.jobs.delete_at(job_number - 1)
        puts "Congrats you got the job #{self.jobs.last.position} at #{self.jobs.last.company}"
        puts "You currently have #{self.jobs.length} job#{'s' if self.jobs.length != 1}"
      else
        puts "Sorry you didn't get the job."
      end
    else
      puts "You messed up getting a job"
    end
  end

  def give_user_job_test
    number = rand(99999999999999999999999)
    puts "Please write the following number in reverse with no spaces"
    puts number.to_s.reverse.split('').join(' ')
    input_number = gets.chomp.to_i
    number == input_number
  end

  def move(cities)
    puts "You currently live in #{@location.name}"
    city_names = []
    cities.each {|i| city_names << i.name}
    city_names.delete(@location.name)
    puts "You wanna move to #{city_names.join(' or ')}?"
    #clear jobs and apartments, keep cats with you
  end

end

class String
  def my_ord
    self.downcase.ord - 96
  end
end