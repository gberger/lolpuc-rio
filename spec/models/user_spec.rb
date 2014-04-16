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
#  summoner_name          :string(255)
#

require 'spec_helper'

describe User do
  describe 'relations' do
    it { should have_many(:members) }
    it { should have_many(:teams).through(:members) }
  end

  describe 'validations' do
    it { should ensure_length_of(:summoner_name).is_at_most(16) }
  end

  describe '#to_param' do
    it 'is the nickname when available' do
      user = build(:user)
      user.to_param.should == user.nickname
    end

    it 'is the id otherwise' do
      user = build(:user, nickname: nil)
      user.to_param.should == user.id
    end
  end
end
