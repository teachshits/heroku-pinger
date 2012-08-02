# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider "twitter"
    uid "12345"
    name "Jimmy"
  end


  factory :user2, class: User do
    provider "twitter"
    uid "12345"
    name "Jimmy"
    id 2
  end
end
