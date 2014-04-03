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

  describe 'instance methods' do
    let(:summoner) { create(:summoner) }

    describe '#fetch_from_api' do
      it 'calls the API' do
        summoner = create(:summoner)
        expect(LOL_CLIENT.summoner).to receive(:by_name).with(summoner.name).and_return([])
        summoner.fetch_from_api
      end
    end

    describe '#update_from_api' do
      it 'calls #fetch_from_api'
      it 'sets the attributes'
    end

    describe 'maybe_update_from_api' do
      it 'updates if the revision date is nil'
      it 'updates if it was last updated more than 15 minutes ago'
      it "doesn't update otherwise"
    end

  end


end
