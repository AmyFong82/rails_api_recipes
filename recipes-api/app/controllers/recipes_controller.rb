class RecipesController < ApplicationController
  #enable wrap_parameters so that the root element can be omitted.
  wrap_parameters format: [:json]
  
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
    head :created
  end

  #GET /recipes/details/:name
  def show
    # here not using find_by! coz don't need to raise an error
    @recipe = Recipe.find_by(name: params[:name])
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
    # here use find_by! coz need to raise an error
    @recipe = Recipe.find_by!(name: params[:recipe][:name])
    @recipe.update(recipe_params)
    head :no_content

  end

  private

  def recipe_params
    #when array is expected, the param symbol should have an empty [] to indicate it.
    params.require(:recipe).permit(:name, :ingredients => [], :instructions => [])
  end

end
