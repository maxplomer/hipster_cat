require_relative './cat'
require_relative './job'
require_relative './apartment'

class City
  # cities should hold the jobs and cats and apartments

  def City.get_default_cities
    [City.new('the suburbs'), City.new('brooklyn'), City.new('LA')]
  end

  attr_reader :name, :cats, :jobs, :apartments

  def initialize(name)
    @name = name
    @cats = get_cats
    @jobs = get_jobs(name)
    @apartments = get_apartments(name)
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

  def get_apartments(city)
    result = []

    rand(10).times do 
      result << Apartment.new
    end

    result
  end

end