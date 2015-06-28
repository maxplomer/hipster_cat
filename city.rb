require_relative './cat'

class City
  # cities should hold the jobs and cats and apartments

  def City.get_default_cities
    [City.new('the suburbs'), City.new('brooklyn'), City.new('LA')]
  end

  attr_reader :name, :cats

  def initialize(name)
    @name = name
    @cats = get_cats
  end

  private

  def get_cats
    result = []

    rand(10).times do 
      result << Cat.new
    end

    result
  end

end