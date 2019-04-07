require 'rails_helper'

describe FamilyMember, type: :model do
  describe  'relationships' do
    it { should belong_to :family }
  end
end
