class Api::V1::Families::RecipesController < ApplicationController

  def index
    family = Family.find_by(id: params[:id])
    if family && family.recipes !=[]
      render json: RecipeSerializer.new(family.recipes)
    else
      render json: "You have no family recipes"
    end
  end

  def show
    recipe = Recipe.find(params[:id])
    render json: RecipeSerializer.new(recipe)
  end


  def create
    family = Family.find_by(id: params[:id])
    if family && recipe_params[:title] && recipe_params[:instructions] && recipe_params[:ingredients]
      render json: Recipe.create(recipe_params)
    else
      render json: "Oops, you forgot some information!", status: :unauthorized
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
  end

  private

  def recipe_params
    params.permit(:title, :ingredients, :instructions, :family_id)
  end

end
