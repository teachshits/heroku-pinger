# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :website do
    url "http://valid-url-5374.herokuapp.com/users/1/edit"
    minute 1
    name "MyString"
    summary "MyText"
    failed_tries 0
    successful_tries 0
    user_id 1
    good_site true
  end

  factory :website1, class: Website do
    url "http://website1.com"
    minute 1
    name "Website 1"
    summary "This is website 1"
    failed_tries 0
    successful_tries 0
    user_id 1
    good_site true
  end

  factory :website2, class: Website do
    url "http://website2.com"
    minute 1
    name "Website 2"
    summary "This is website 2"
    failed_tries 0
    successful_tries 0
    user_id 1
    good_site true
  end

  factory :website3, class: Website do
    url "http://website3.com"
    minute 1
    name "Website 3"
    summary "This is website 3"
    failed_tries 0
    successful_tries 0
    user_id 1
    good_site true
  end

  factory :website4, class: Website do
    url "http://website4.com"
    minute 1
    name "Website 4"
    summary "This is website 4"
    failed_tries 0
    successful_tries 0
    user_id 1
    good_site true
  end

  factory :website5, class: Website do
    url "http://website5.com"
    minute 1
    name "Website 5"
    summary "This is website 5"
    failed_tries 0
    successful_tries 0
    user_id 1
    good_site true
  end

  factory :website6, class: Website do
    url "http://website6.com"
    minute 1
    name "Website 6"
    summary "This is website 6"
    failed_tries 0
    successful_tries 0
    user_id 1
    good_site true
  end

end
