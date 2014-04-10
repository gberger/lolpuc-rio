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
    it { should ensure_exclusion_of(:acronym).in_array(%w[new edit]) }
  end
end
