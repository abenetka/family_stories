class Api::V1::Families::RecipesController < ApplicationController
  def index
    family = Family.find_by(id: params[:id])
    if family && family.recipes !=[]
      render json: RecipeSerializer.new(family.recipes)
    else
      render json: "You have no family recipes"
    end
  end
end
