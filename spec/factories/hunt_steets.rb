# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :hunt_steet do
    user_id 1
    street_id 1
    status "MyString"
    rating 1
  end
end
