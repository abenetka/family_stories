require 'rails_helper'

describe 'Families API' do
  it "returns all families" do

  get '/api/v1/families'

  expect(response).to be_successful
  end
end
