require 'rails_helper'

describe "Stories API" do
  it 'returns stories for a particular family' do
    family_1 = create(:family)
    family_2 = create(:family)
    story_1 = create(:story, family: family_1)
    story_2 = create(:story, family: family_1)
    story_3 = create(:story, family: family_1)
    story_4 = create(:story, family: family_2)

    get "/api/v1/families/#{family_1.id}/stories"

    expect(response).to be_successful

    stories = JSON.parse(response.body)
    expect(stories["data"][0]["id"]).to eq(story_1.id.to_s)
    expect(stories["data"][1]["id"]).to eq(story_2.id.to_s)
    expect(stories["data"][2]["id"]).to eq(story_3.id.to_s)
    expect(stories["data"][-1]["id"]).to_not eq(story_4.id.to_s)
    expect(stories["data"][0]["relationships"]["family"]["data"]["id"]).to eq(family_1.id.to_s)
    expect(stories["data"][0]["relationships"]["family"]["data"]["id"]).to_not eq(family_2.id.to_s)
  end
  it 'returns no stories for family if none present' do
    family_1 = create(:family)
    get "/api/v1/families/#{family_1.id}/stories"

    expect(response).to be_successful
    expect(response.body).to eq("No stories for this family")
  end
  it "returns one story for family by story id" do
    family_1 = create(:family)
    family_2 = create(:family)
    story_1 = create(:story, family: family_1)
    story_2 = create(:story, family: family_2)
    get "/api/v1/families/#{family_1.id}/stories/#{story_1.id}"

    expect(response).to be_successful
    story = JSON.parse(response.body)

    expect(story["id"]).to eq(story_1.id)
    expect(story["title"]).to eq(story_1.title)
    expect(story["content"]).to eq(story_1.content)
    expect(story["author"]).to eq(story_1.author)
    expect(story["family_id"]).to eq(story_1.family_id)
    expect(story["id"]).to_not eq(story_2.id)
    expect(story["title"]).to_not eq(story_2.title)
  end
end
