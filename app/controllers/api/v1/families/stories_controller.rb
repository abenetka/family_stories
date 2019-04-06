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
    if story_params[:title] && story_params[:content] && story_params[:author]
      render json: Story.create(story_params)
    else
      render json:"You're missing some information, friend!", status: :unauthorized
    end
  end

  private
  def story_params
    params.require(:story).permit(:title, :content, :author, :family_id)
  end
end
