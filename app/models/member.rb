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

class Member < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :team, dependent: :destroy

  validates_presence_of :team
  validates_presence_of :user

  def summary
    "#{user.summoner.name} (#{user.name}) - #{role}" + (leader ? ' (lider)' : '')
  end

  def leader?
    leader
  end
end
