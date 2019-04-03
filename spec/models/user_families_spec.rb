require 'rails_helper'

describe UserFamily, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :family }
  end

end
