require 'spec_helper'

describe User do
  describe 'relations' do
    it { should have_one(:summoner) }
  end

  describe '#kind?' do
    before { stub_const('User::KINDS', %w(basic medium admin)) }
    let(:user) { build(:user, kind: 'medium') }

    it 'is true when user is a higher level' do
      user.kind?(:basic).should == true
    end

    it 'is true when user is the same level' do
      user.kind?(:medium).should == true
    end

    it 'is false when the user is a lower level' do
      user.kind?(:admin).should == false
    end

    it 'works for symbols and strings alike' do
      user.kind?(:medium).should == user.kind?('medium')
    end
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
