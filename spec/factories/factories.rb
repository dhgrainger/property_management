# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building do
    address '6 spice street'
    city 'Charlestown'
    state 'MA'
    postal_code '02129'
    description 'Abandoned warehouse'
    owner
  end

   factory :owner do
    first_name 'Owner'
    last_name 'Ownerson'
    sequence(:email) {|n| "test#{n}@test.com"}
    company 'Ballers.inc'
  end
end
