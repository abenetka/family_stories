class Api::V1::FamiliesController < ApplicationController
  def index
    render json: Family.all
  end
end
