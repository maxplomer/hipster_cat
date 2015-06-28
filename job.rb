class Job

  COMPANIES = {
    'the suburbs' => [
      'Stop and Shop',
      'The Ski Shop',
      'Town Beach',
      'McDonalds'
    ],
    'brooklyn' => [
      'Vice',
      'Kickstarter',
      'Vegan Restaurant',
      'Etsy',
      'Bar on the corner'
    ],
    'LA' => [
      'Plastic Surgery Office',
      'Music Studio',
      'Food Truck'
    ]
  }

  POSITIONS = [
    'web developer',
    'house cleaner',
    'CEO'
  ]
  
  attr_reader :company, :position

  def initialize(city)
    @company = get_company(city)
    @position = get_position
  end

  def get_company(city)
    COMPANIES[city].sample
  end

  def get_position
    POSITIONS.sample
  end

end