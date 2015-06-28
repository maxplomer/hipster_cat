class City
  # cities should hold the jobs and cats and apartments

  def City.get_default_cities
    [City.new('suburbs'), City.new('brooklyn'), City.new('LA')]
  end

  attr_reader :name

  def initialize(name)
    @name = name
  end

end