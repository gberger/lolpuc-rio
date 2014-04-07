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
