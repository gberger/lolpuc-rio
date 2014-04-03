# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider "MyString"
    uid "MyString"
    name "MyString"
    nickname "MyString"
    email "MyString"
    oauth_token "MyString"
    oauth_token_expires_at "MyString"
    role "MyString"
  end
end
