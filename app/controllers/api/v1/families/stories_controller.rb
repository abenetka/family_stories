class Api::V1::Families::StoriesController < ApplicationController
  def index
    family = Family.find(params[:id])
    if family && family.stories != []
      render json: StorySerializer.new(family.stories)
    else
      render json: "No stories for this family"
    end
  end

  def create
    render json: Story.create(story_params)
  end

  private
  def story_params
    params.require(:story).permit(:title, :content, :author, :family_id)
  end
end
