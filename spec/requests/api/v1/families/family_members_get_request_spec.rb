require 'rails_helper'

describe 'Family Members API' do
  it "returns all family_members for one family" do
    family_1 = create(:family)
    family_2 = create(:family)
    create_list(:family_member, 3, family: family_1)
    create_list(:family_member, 2, family: family_2)

    get "/api/v1/families/#{family_1.id}/family_members"
    expect(response).to be_successful

    family_members = JSON.parse(response.body)["data"]
    expect(family_members.count).to eq(3)
    expect(family_members[0]["relationships"]["family"]["data"]["id"]).to eq(family_1.id.to_s)
    expect(family_members[1]["relationships"]["family"]["data"]["id"]).to eq(family_1.id.to_s)
    expect(family_members[2]["relationships"]["family"]["data"]["id"]).to eq(family_1.id.to_s)
    expect(family_members[0]["relationships"]["family"]["data"]["id"]).to_not eq(family_2.id.to_s)
    expect(family_members[1]["relationships"]["family"]["data"]["id"]).to_not eq(family_2.id.to_s)
    expect(family_members[2]["relationships"]["family"]["data"]["id"]).to_not eq(family_2.id.to_s)
  end
  it "returns no family_members if none exist" do
    id = create(:family).id
    get "/api/v1/families/#{id}/family_members"

    expect(response).to be_successful

    expect(response.body).to eq("You have no family members listed")
  end
end
