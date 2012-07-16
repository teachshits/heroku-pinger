# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ping do
    status 1
    response_length 1
    website_id 1
  end
end
