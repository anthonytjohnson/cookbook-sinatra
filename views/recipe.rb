class Recipe
  attr_reader :name, :description, :rating, :done, :prep

  def initialize(name, description, rating, prep)
    @name = name
    @description = description
    @rating = rating
    @prep = prep
    @done = false
  end

  def done!
    @done = true
  end
end
