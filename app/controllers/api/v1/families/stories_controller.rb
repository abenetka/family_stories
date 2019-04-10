class Api::V1::Families::StoriesController < ApplicationController
  def index
    family = Family.find(params[:id])
    if family && family.stories != []
      render json: StorySerializer.new(family.stories)
    else
      render json: "No stories for this family", status: :partial_content
    end
  end

  def show
    story = Story.find(params[:id])
    if story
      render json: StorySerializer.new(story)
    end
  end

  def destroy
    story = Story.find(params[:id])
    if story
      story.destroy
    end
  end

  def create
    family = Family.find_by(id: params[:id])
    if family && story_params[:title] && story_params[:content] && story_params[:author]
      render json: Story.create(story_params)
    else
      render json:"You're missing some information, friend!", status: :unauthorized
    end
  end

  private
  def story_params
    params.permit(:title, :content, :author, :family_id)
  end
end
