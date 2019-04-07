require 'rails_helper'

describe Story, type: :model do
  describe 'relationships' do
    it { should belong_to :family }
  end
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :content }
    it { should validate_presence_of :author }
  end
end
