class User < ActiveRecord::Base
  has_one :summoner

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

  def identifier
    nickname || id
  end
end
