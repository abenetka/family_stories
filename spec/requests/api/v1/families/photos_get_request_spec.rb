require 'rails_helper'

describe 'Photos API' do
  it "returns all photos for one family" do
    family_1 = create(:family)
    family_2 = create(:family)
    create_list(:photo, 3, family: family_1)
    create_list(:photo, 2, family: family_2)

    get "/api/v1/families/#{family_1.id}/photos"
    expect(response).to be_successful

    photos = JSON.parse(response.body)["data"]
    expect(photos.count).to eq(3)
    expect(photos[0]["relationships"]["family"]["data"]["id"]).to eq(family_1.id.to_s)
    expect(photos[1]["relationships"]["family"]["data"]["id"]).to eq(family_1.id.to_s)
    expect(photos[2]["relationships"]["family"]["data"]["id"]).to eq(family_1.id.to_s)
    expect(photos[0]["relationships"]["family"]["data"]["id"]).to_not eq(family_2.id.to_s)
    expect(photos[1]["relationships"]["family"]["data"]["id"]).to_not eq(family_2.id.to_s)
    expect(photos[2]["relationships"]["family"]["data"]["id"]).to_not eq(family_2.id.to_s)
  end
  it "returns no photos if none exist" do
    id = create(:family).id
    get "/api/v1/families/#{id}/photos"

    expect(response).to be_successful

    expect(response.body).to eq("You have no family photos")
  end
end
