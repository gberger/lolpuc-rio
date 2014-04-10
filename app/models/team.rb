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

class Team < ActiveRecord::Base
  has_many :members
  has_many :users, through: :members

  validates_uniqueness_of :name
end
