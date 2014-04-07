class Team < ActiveRecord::Base
  has_many :members
  has_many :users, through: :members

  validates_uniqueness_of :name
end
