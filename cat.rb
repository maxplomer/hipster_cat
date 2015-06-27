require 'time-lord'

class Cat

  NAMES = [
    'fro',
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

  COLORS = [

  ]

  BREEDS = [

  ]

  attr_reader :name, :color, :breed, :sex, :birthdate, :description

  def initialize()
    @name = NAMES.shuffle.first
    @color = 'blue'
    @birthday = 
  end

  def age
    birth_date.to_words
  end

  private

  def generate_birth_date
    Time.at(rand * Time.now.to_i) #This will generate a random date from epoch to now
  end

  def gaussian(mean, stddev, rand)
    theta = 2 * Math::PI * rand.call
    rho = Math.sqrt(-2 * Math.log(1 - rand.call))
    scale = stddev * rho
    x = mean + scale * Math.cos(theta)
    y = mean + scale * Math.sin(theta)
    return x, y
  end

end




