# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  provider               :string(255)      not null
#  uid                    :string(255)      not null
#  name                   :string(255)      not null
#  nickname               :string(255)
#  email                  :string(255)
#  oauth_token            :string(255)      not null
#  oauth_token_expires_at :string(255)      not null
#  kind                   :integer          default(0), not null
#  created_at             :datetime
#  updated_at             :datetime
#

require 'spec_helper'

describe User do
  describe 'relations' do
    it { should have_one(:summoner) }
    it { should have_many(:members) }
    it { should have_many(:teams).through(:members) }
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
