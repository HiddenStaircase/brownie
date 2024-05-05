class Foods::SearchController < ApplicationController
  FOODS = %w[
    Tofu
    Grass
    Banana
    Banana\ Bread
    Apple
    Beef
    Soy\ Milk
    Oat\ Milk
    Goat\ Cheese
    Cheddar\ Cheese
    Gouda
    Blue\ Cheese
    Soy\ Cheese
    Soy\ Beans
    Brown\ Sugar
    White\ Sugar
    Powdered\ Sugar
    Salt
    Flour
    Beer
  ]

  def index
    # Food_search is our model
    @food_search = OpenStruct.new(
      foods: filter_foods(search_params[:search_term]),
      search_term: search_params[:search_term]
    )
  end

  private

  # Search_term
  def search_params
    params
      .permit(:search_term)
      .with_defaults(search_term: '')
  end

  def pagination_params

  end

  def filter_foods name
    predicate = ->(food) { food.include? name }
    FOODS.select(&predicate)
  end
end
