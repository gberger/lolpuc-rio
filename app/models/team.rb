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
  include CaseInsensitiveFindable

  has_many :members, dependent: :destroy
  has_many :users, through: :members

  validates_uniqueness_of :name
  validates_presence_of :name
  validates_uniqueness_of :acronym
  validates_presence_of :acronym
  validates_exclusion_of :acronym, in: %w[new]
  validates_format_of :acronym, with: /\A[\w\.]{1,5}\z/   # Alphanumeric, underscore, dot, max 5
  # TODO:
  # validates_presence_of :leader

  def to_param
    acronym
  end

  def summary
    "#{name} [#{acronym}]"
  end

  def leader
    members.find { |m| m.leader? }
  end

  def self.new_with_leader(params, user)
    team = new(params)
    team.members << Member.new(user: user, leader: true, confirmed: true)
    team
  end
end
