require 'rails_helper'

describe 'Families API' do
  it "returns all families" do
    create_list(:family, 2)
    get '/api/v1/families'

    expect(response).to be_successful

    families = JSON.parse(response.body)
    expect(families.count).to eq(2)
  end

  it "can get one family by its id" do
      id = create(:family).id

      get "/api/v1/families/#{id}"
      family = JSON.parse(response.body)
      
      expect(response).to be_successful
      expect(family["id"]).to eq(id)
  end
end
