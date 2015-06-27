require 'time-lord'

class Cat

  NAMES = [
    'Afro',
    'Archibald',
    'Babe',
    'Bacon',
    'Banjo',
    'Barney',
    'Big Guy',
    'Big Red',
    'Biggie Smalls',
    'Bilbo',
    'Billy the Kid',
    'Bimmer',
    'Bingo',
    'Biscuit',
    'Blue (Blu)',
    'Bobby (Mcgee)',
    'Bond',
    'Bones',
    'Boss',
    'Brain',
    'Brownie',
    'Bubba',
    'Buckaroo',
    'Buffalo Bill',
    'Burger',
    'Buster',
    'Byte',
    'Caesar',
    'Chewie',
    'Chubby',
    'Chuck Norris',
    'Churchill',
    'Clark Griswold',
    'Clark Kent',
    'Cletus',
    'Clumsy',
    'Cookie Monster',
    'Copernicus',
    'Crookshanks',
    'Cyrano',
    'Deputy Dawg',
    'Dickens',
    'Dilbert',
    'Donald Trump',
    'Doonesbury',
    'Dude',
    'Dynamite',
    'E.T.',
    'Einstein',
    'Elf',
    'Elmo',
    'Emo',
    'Ewok',
    'Fabio',
    'Farley',
    'Fuzzy',
    'Garfield',
    'Goliath',
    'Gonzo',
    'Gordo',
    'Grumpy Cat',
    'Hamlet',
    'Hansel',
    'Harry',
    'Heathcliff',
    'Hobbit',
    'Homer',
    'Jasper',
    'Jeckyll',
    'Jerry Lee',
    'Kerouac',
    'Killer',
    'Lancelot',
    'Macbeth',
    'Macgyver',
    'Marky Mark',
    'Monet',
    'Mr. Bigglesworth',
    'Mr. Jinx',
    'Mulligan',
    'Ninja',
    'OJ',
    'Ole',
    'Oreo',
    'Peanut Butter',
    'Pee Wee',
    'Picasso',
    'Pistol',
    'Porkchop',
    'Puck',
    'Puss in Boots',
    'Quixote',
    'Ricky Bobby',
    'Rogue',
    'Sable',
    'Sailor',
    'Scat Cat',
    'Seuss',
    'Sir-Barks-Alot',
    'Sockington',
    'Spud',
    'Squirt',
    'Stewie',
    'Sven',
    'T-Bone',
    'Taco',
    'Tiger',
    'Tigger',
    'Underdog',
    'Waffles',
    'Wagner',
    'Waldo',
    'Whiskers',
    'Yoda'
  ]

  COLORS = {
    'Solid' => [
      'Black',
      'Gray',
      'White',
      'Chocolate or Brown'
    ],
    'Tabby or Tiger Colors' => [
      'Black Tiger',
      'Brown Tiger',
      'Gray Tiger',
      'Orange Tiger'
    ],
    'With White' => [
      'Black & White',
      'Gray & White',
      'Orange Tiger & White',
      'Brown Tiger & White'
    ],
    'Calicos, Torties and Torbies' => [
      'Calico',
      'Tortie',
      'Torbie'
    ],
    'Dilutes or Shaded Colors' => [
      'Dilute Calico',
      'Dilute Tortie',
      'Buff'
    ],
    'Pointed Colors' => [
      'Chocolate Point',
      'Flame Point',
      'Lynx Point',
      'Seal Point',
      'Seal Lynx Point',
      'Snowshoe'
    ]
  }

  attr_reader :name, :color, :sex, :birthdate, :description

  def initialize()
    @name        = get_name
    @color       = get_color
    @sex         = get_sex
    @birthdate   = get_birthdate
    @description = get_description
  end

  def age
    birthdate.ago.to_words.gsub('ago', 'old')
  end

  private

  def get_name
    NAMES.sample
  end

  def get_sex
    ['male', 'female'].sample
  end

  def get_color
    COLORS[COLORS.keys.sample].sample
  end

  def get_birthdate
    age = gaussian(8, 2, lambda { Kernel.rand } )[rand(2)]
    Time.at(Time.now.to_i - age * 3.15569e7)
  end

  def gaussian(mean, stddev, rand)
    # Box–Muller transform
    theta = 2 * Math::PI * rand.call
    rho = Math.sqrt(-2 * Math.log(1 - rand.call))
    scale = stddev * rho
    x = mean + scale * Math.cos(theta)
    y = mean + scale * Math.sin(theta)
    return x, y
  end

  def get_description
    'helloworld'
  end

end




