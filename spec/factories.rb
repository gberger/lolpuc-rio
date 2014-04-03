# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider "facebook"
    uid "123456"
    name "John Doe"
    nickname "john.doe"
    email "john.doe@example.com"
    oauth_token "averylongstring"
    oauth_token_expires_at "2014-06-02 01:38:04.000000"
    role "basic"
  end

  factory :summoner do
    name "Some Summoner"
    summoner_id 1234567
    level 30
    profile_icon_id 30
    revision_date { Time.now - 1.hour }
    user
  end
end