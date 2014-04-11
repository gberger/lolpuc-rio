# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#  acronym    :string(255)      not null
#

require 'spec_helper'

describe Team do
  describe 'relations' do
    it { should have_many(:members) }
    it { should have_many(:users).through(:members) }
  end

  describe 'validations' do
    before { create(:team) }

    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:acronym) }
    it { should validate_presence_of(:acronym) }
    it { should ensure_exclusion_of(:acronym).in_array(%w[new]) }
    it { should allow_value('Aa1_.').for(:acronym) }
    it { should allow_value('ABC').for(:acronym) }
    it { should_not allow_value('<#$%&').for(:acronym) }
    it { should_not allow_value('ABC123').for(:acronym) }
  end

  describe '#leader' do
    it 'returns the member who is the leader' do
      team = create(:team)
      users = create_list(:user, 2)
      member = create(:member, team: team, user: users[0], role: 'adc')
      leader = create(:member, team: team, user: users[1], leader: true, role: 'top')

      team.leader.should == leader
    end

    it "returns nil when there's no leader" do
      team = create(:team)
      users = create_list(:user, 2)
      create(:member, team: team, user: users[0], role: 'adc')
      create(:member, team: team, user: users[1], role: 'top')

      team.leader.should be_nil
    end
  end

  describe '::new_with_leader' do

  end
end
