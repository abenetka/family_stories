require 'rails_helper'

describe 'Families API' do
  it "can create a family" do
    family_params = { name: "Fay" }

    post "/api/v1/families", params: family_params

    family = Family.last

    expect(response).to be_successful
    expect(family.name).to eq(family_params[:name])
  end

  it "wont create a family with missing information" do
    family_params = { not_a_name: ""}

    post "/api/v1/families", params: family_params

    family = Family.last

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(response.body).to eq("Oops, you forgot some information!")
  end
end
