require 'spec_helper'

describe User do
  describe 'relations' do
    it { should have_one(:summoner) }
  end

  describe '#identifier' do
    it 'is the nickname when available' do
      user = build(:user)
      user.identifier.should == user.nickname
    end

    it 'is the id otherwise' do
      user = build(:user, nickname: nil)
      user.identifier.should == user.id
    end
  end
end
