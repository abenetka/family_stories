class Api::V1::Families::PhotosController < ApplicationController
  def index
    family = Family.find_by(id: params[:id])
    if family && family.photos !=[]
      render json: PhotoSerializer.new(family.photos)
    else
      render json: "You have no family photos"
    end
  end
end
