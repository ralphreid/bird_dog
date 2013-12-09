# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :property do
    source "MyString"
    type ""
    rent 1
    rent_frequency "MyString"
    property_page "MyText"
    terms "MyString"
    image_listing "MyText"
    listing_blurb "MyText"
    arrange_view_link "MyText"
  end
end
