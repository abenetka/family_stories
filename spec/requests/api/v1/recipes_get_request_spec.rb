require 'rails_helper'

describe 'Recipes API' do
  it "returns all recipes for one family" do
    id = create(:family).id
    family = create(:family, id: 2)
    create_list(:recipe, 3, family_id: id)
    create_list(:recipe, 2, family_id: family.id)

    get "/api/v1/families/#{id}/recipes"

    expect(response).to be_successful

    recipes = JSON.parse(response.body)["data"]
    expect(recipes.count).to eq(3)
    expect(recipes[0]["relationships"]["family"]["data"]["id"]).to eq(id.to_s)
    expect(recipes[1]["relationships"]["family"]["data"]["id"]).to eq(id.to_s)
    expect(recipes[2]["relationships"]["family"]["data"]["id"]).to eq(id.to_s)
    expect(recipes[0]["relationships"]["family"]["data"]["id"]).to_not eq(family.id.to_s)
    expect(recipes[1]["relationships"]["family"]["data"]["id"]).to_not eq(family.id.to_s)
    expect(recipes[2]["relationships"]["family"]["data"]["id"]).to_not eq(family.id.to_s)
  end
  it "returns no recipes if none exist" do
    id = create(:family).id
    get "/api/v1/families/#{id}/recipes"

    expect(response).to be_successful

    expect(response.body).to eq("You have no family recipes")
  end
end
