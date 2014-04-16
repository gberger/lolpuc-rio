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

class Tournament < ActiveRecord::Base
  validates_presence_of :name
end
