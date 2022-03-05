class RecipesController < ApplicationController
  #enable wrap_parameters so that the root element can be omitted.
  wrap_parameters format: [:json]
  
  before_action :find_recipe, only: [:show, :update]

  #GET /recipes
  def index
    @recipes = Recipe.all
    @recipeNames = []
    @recipes.each {|e| @recipeNames << e.name}
    json_response({recipeNames: @recipeNames})
  end

  #POST /recipes
  def create
    @recipe = Recipe.create!(recipe_params)
    json_response(@recipe, :created)

    # head :no_content
  end

  #GET /recipes/details/:name
  def show
    if @recipe
      @details = {
        ingredients: @recipe.ingredients,
        numSteps: @recipe.instructions.length
      }
      json_response({details: @details})
    else
      json_response({})
    end
  end

  # PUT /recipes
  def update
    @recipe.update(recipe_params)
    head :no_content
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :ingredients => [], :instructions => [])
  end

  def find_recipe
    @recipe = Recipe.find_by(name: params[:name])
  end
end
