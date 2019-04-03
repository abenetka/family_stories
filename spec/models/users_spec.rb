require 'rails_helper'

describe User, type: :model do
  describe 'relationships' do
    it { should have_many :user_families }
    it { should have_many(:families).through(:user_families) }
  end

end
