class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :update]

  #GET /recipes
  def index
    @recipes = Recipe.all
    json_response(@recipes)
  end

  #POST /recipes
  def create
    @recipe = Recipe.create!(recipe_params)
    head :no_content
  end

  #GET /recipes/details/:name
  def show
    json_response(@recipe)
  end

  # PUT /recipes
  def update
    @recipe.update(recipe_params)
    head :no_content
  end

  private

  def recipe_params
    params.permit(:name, :ingredients, :instructions)
  end

  def find_recipe
    @recipe = Recipe.find_by(name: params[:name])
  end
end
