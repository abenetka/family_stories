require 'rails_helper'

describe 'Recipes API' do
  it "returns all recipes for one family" do
    family_1 = create(:family)
    family_2 = create(:family)
    create_list(:recipe, 3, family: family_1)
    create_list(:recipe, 2, family: family_2)

    get "/api/v1/families/#{family_1.id}/recipes"

    expect(response).to be_successful

    recipes = JSON.parse(response.body)["data"]
    expect(recipes.count).to eq(3)
    expect(recipes[0]["relationships"]["family"]["data"]["id"]).to eq(family_1.id.to_s)
    expect(recipes[1]["relationships"]["family"]["data"]["id"]).to eq(family_1.id.to_s)
    expect(recipes[2]["relationships"]["family"]["data"]["id"]).to eq(family_1.id.to_s)
    expect(recipes[0]["relationships"]["family"]["data"]["id"]).to_not eq(family_2.id.to_s)
    expect(recipes[1]["relationships"]["family"]["data"]["id"]).to_not eq(family_2.id.to_s)
    expect(recipes[2]["relationships"]["family"]["data"]["id"]).to_not eq(family_2.id.to_s)
  end
  it "returns no recipes if none exist" do
    id = create(:family).id
    get "/api/v1/families/#{id}/recipes"

    expect(response).to be_successful
    expect(response.body).to eq("You have no family recipes")
  end

  it "can create a new recipe" do
    family_1 = create(:family)
    recipe_params = { title: "Chocolate Chip Cookies",
                      ingredients: "Flour, Sugar, Eggs, Butter, Chocolate Chips",
                      instructions: "Mix together and bake",
                      family_id: family_1.id
                    }
    post "/api/v1/families/#{family_1.id}/recipes", params: {recipe: recipe_params }

    recipe = Recipe.last

    expect(response).to be_successful
    expect(recipe.title).to eq(recipe_params[:title])
  end

  it "wont create a recipe without all required params" do
    family_1 = create(:family)
    recipe_params = {
                      ingredients: "Flour, Sugar, Eggs, Butter, Chocolate Chips",
                      instructions: "Mix together and bake",
                      family_id: family_1.id
                    }
    post "/api/v1/families/#{family_1.id}/recipes", params: {recipe: recipe_params }

    recipe = Recipe.last

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(response.body).to eq("Oops, you forgot some information!")
  end
end
