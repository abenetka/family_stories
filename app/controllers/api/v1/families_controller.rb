class Api::V1::FamiliesController < ApplicationController
  def index
    render json: Family.all
  end

  def show
    render json: Family.find(params[:id])
  end
end
