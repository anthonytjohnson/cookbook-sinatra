class Cookbook
  require 'csv'

  attr_reader :recipes

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = [] # array of instances of Recipe
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    save_csv
  end

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      # We don't want to push an array of strings, we want an instance of Recipe
      @recipes << Recipe.new(row[0], row[1], row[2], row[3])
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe| # recipe is an instance of Recipe
        csv << [recipe.name, recipe.description, recipe.rating, recipe.prep]
      end
    end
  end
end
