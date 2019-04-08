class Api::V1::FamiliesController < ApplicationController
  def index
    render json: Family.all
  end

  def show
    render json: Family.find(params[:id])
  end

  def create
    if family_params[:name]
      render json: Family.create(family_params)
    else
      render json: "Oops, you forgot some information!", status: :unauthorized
    end
  end

  private

  def family_params
    params.require(:family).permit(:name)
  end
end
