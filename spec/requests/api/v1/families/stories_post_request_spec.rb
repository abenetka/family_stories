require 'rails_helper'

describe "Stories API" do
  it "can create a new story" do
    family_1 = create(:family)
    story_params = { title: "Face Smash 1972", content: "Herman broke his face on a fence post", author: "Kathy", family_id: family_1.id }

    post "/api/v1/families/#{family_1.id}/stories", params: story_params

    story = Story.last

    expect(response).to be_successful
    expect(story.title).to eq(story_params[:title])
  end
  it "cannot add a story with incomplete information" do
    family_1 = create(:family)
    story_params = { title: "Face Smash 1972" }

    post "/api/v1/families/#{family_1.id}/stories", params: {story: story_params}

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(response.body).to eq("You're missing some information, friend!")
  end
end
