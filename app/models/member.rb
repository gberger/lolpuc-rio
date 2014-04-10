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
#

class Member < ActiveRecord::Base
  belongs_to :user
  belongs_to :team

  validates_presence_of :team
  validates_presence_of :user
end
