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
    it { should validate_uniqueness_of(:name) }
  end
end
