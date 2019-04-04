require 'rails_helper'

describe 'Families API' do
  it "returns all families" do
    create_list(:family, 2)
    get '/api/v1/families'

    expect(response).to be_successful

    families = JSON.parse(response.body)
    expect(families.count).to eq(2)
  end
end
