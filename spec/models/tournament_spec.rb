# == Schema Information
#
# Table name: tournaments
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  edital     :text
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Tournament do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
