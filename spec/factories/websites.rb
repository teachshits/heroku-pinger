# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :website do
    url "MyString"
    minute 1
    name "MyString"
    summary "MyText"
    failed_tries 1
    successful_tries 1
    user_id 1
  end
end
