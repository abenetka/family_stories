require 'rails_helper'

describe 'Stories API' do
  it "can delete a story by id" do
    family_1 = create(:family)
    story_1 = create(:story, family: family_1)
    story_2 = create(:story, family: family_1)

    get "/api/v1/families/#{family_1.id}/stories"
    expect(response).to be_successful
    stories = JSON.parse(response.body)["data"]
    expect(stories.count).to eq(2)

    delete "/api/v1/families/#{family_1.id}/stories/#{story_1.id}"

    expect(response).to be_successful
    expect(status).to eq(204)

    get "/api/v1/families/#{family_1.id}/stories"
    expect(response).to be_successful
    stories = JSON.parse(response.body)["data"]
    expect(stories.count).to eq(1)
  end
end
