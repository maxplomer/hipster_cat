require_relative './cat'
require_relative './job'

class City
  # cities should hold the jobs and cats and apartments

  def City.get_default_cities
    [City.new('the suburbs'), City.new('brooklyn'), City.new('LA')]
  end

  attr_reader :name, :cats, :jobs

  def initialize(name)
    @name = name
    @cats = get_cats
    @jobs = get_jobs(name)
  end

  private

  def get_cats
    result = []

    rand(10).times do 
      result << Cat.new
    end

    result
  end

  def get_jobs(city)
    result = []

    rand(10).times do 
      result << Job.new(city)
    end

    result
  end

end