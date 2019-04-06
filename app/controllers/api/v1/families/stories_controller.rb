class Api::V1::Families::StoriesController < ApplicationController
  def index
    family = Family.find(params[:id])
    if family && family.stories != []
      render json: StorySerializer.new(family.stories)
    else
      render json: "No stories for this family"
    end
  end

end
