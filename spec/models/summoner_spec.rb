require 'spec_helper'

describe Summoner do
  describe 'relations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:user) }
    it { should ensure_length_of(:name).is_at_least(1).is_at_most(16) }
  end
end
