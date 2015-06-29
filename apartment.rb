class Apartment

  ADJECTIVES = [
    "tiny",
    "smelly",
    "spacious",
    "industrial",
    "chill",
    "",
    "groundlevel"
  ]

  TYPES = [
    "studio",
    "3 bedroom",
    "apartment"
  ]

  AMMENITIES = [
    "with a view",
    "with a view of the water",
    "might have a couple sewer flies no big deal",
    "on the 40th floor",
    "in an up and coming area",
    "with a roommate who's in a band",
    "close to the vegan restaurant",
    "way on the other side of town"
  ]

  attr_reader :description

  def initialize
    @description = "A #{ADJECTIVES.sample} #{TYPES.sample} #{AMMENITIES.sample}"
  end

end