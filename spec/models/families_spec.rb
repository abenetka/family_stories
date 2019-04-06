require 'rails_helper'

describe Family, type: :model do
  describe 'relationships' do
    it { should have_many :user_families }
    it { should have_many(:users).through(:user_families) }

      it { should have_many :stories }
      it { should have_many :recipes }
      it { should have_many :photos }
  end

end
