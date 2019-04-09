require 'rails_helper'

describe Recipe, type: :model do
  describe 'relationships' do
    it { should belong_to :family }
  end
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :ingredients }
    it { should validate_presence_of :instructions }
  end


end
