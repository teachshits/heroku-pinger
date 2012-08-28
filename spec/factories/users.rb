# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider "twitter"
    uid "12345"
    name "Jimmy"
    number_of_sites 0
  end


  factory :user2, class: User do
    provider "twitter"
    uid "12346"
    name "Jimmy 2"
    id 2
    number_of_sites 0
  end
end
