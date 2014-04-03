class Summoner < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :user
  validates_length_of :name, minimum: 1, maximum: 16, allow_blank: false

  def update_from_api
    response = fetch_from_api
    self.summoner_id = response.id
    self.profile_icon_id = response.profile_icon_id
    self.level = response.summoner_level
    self.revision_date = response.revision_date
  end

  def fetch_from_api
    LOL_CLIENT.summoner.by_name(name).first
  end

private

  before_save :maybe_update_from_api
  after_find :maybe_update_from_api
  def maybe_update_from_api
    if revision_date.nil? || updated_at + 15.minutes < Time.now
      update_from_api
      save!
    end
  end
end
