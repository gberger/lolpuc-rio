# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  leader     :boolean          default(FALSE), not null
#  role       :string(255)
#  user_id    :integer          not null
#  team_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  confirmed  :boolean          default(FALSE), not null
#

require 'spec_helper'

describe Member do
  describe 'relations' do
    it { should belong_to(:user) }
    it { should belong_to(:team) }
  end

  describe 'validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:team) }
  end
end
