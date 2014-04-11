# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  provider               :string(255)      not null
#  uid                    :string(255)      not null
#  name                   :string(255)      not null
#  nickname               :string(255)
#  email                  :string(255)
#  oauth_token            :string(255)      not null
#  oauth_token_expires_at :string(255)      not null
#  kind                   :integer          default(0), not null
#  created_at             :datetime
#  updated_at             :datetime
#

class User < ActiveRecord::Base
  include CaseInsensitiveFindable

  enum kind: [:basic, :admin]

  has_one :summoner
  has_many :members
  has_many :teams, through: :members

  def to_param
    nickname || id
  end

  # CanCanCan
  def ability
    @ability ||= Ability.new(self)
  end
  delegate :can?, :cannot?, to: :ability

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.nickname = auth.info.nickname
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_token_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
