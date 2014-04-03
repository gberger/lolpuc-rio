class Summoner < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :user
  validates_length_of :name, minimum: 1, maximum: 16, allow_blank: false
end
