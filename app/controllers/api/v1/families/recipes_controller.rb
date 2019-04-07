class Api::V1::Families::RecipesController < ApplicationController
  def index
    family = Family.find_by(id: params[:id])
    if family && family.recipes !=[]
      render json: RecipeSerializer.new(family.recipes)
    else
      render json: "You have no family recipes"
    end
  end

  def create
    if recipe_params[:title] && recipe_params[:ingredients] && recipe_params[:instructions] && recipe_params[:family_id]
      render json: Recipe.create(recipe_params)
    else
      render json: "Oops, you forgot some information!", status: :unauthorized
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :instructions, :family_id)
  end

end
