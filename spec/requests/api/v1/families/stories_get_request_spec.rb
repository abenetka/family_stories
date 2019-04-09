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
    expect(stories["data"][0]["relationships"]["family"]["data"]["id"]).to eq(family_1.id.to_s)
    expect(stories["data"][0]["relationships"]["family"]["data"]["id"]).to_not eq(family_2.id.to_s)
  end

  it 'returns no stories for family if none present' do
    family_1 = create(:family)
    get "/api/v1/families/#{family_1.id}/stories"

    expect(response).to be_successful
    expect(response.body).to eq("No stories for this family")
  end

end
