# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building do
    address '6 spice street'
    city 'Charlestown'
    state 'MA'
    postal_code '02129'
    description 'Abandoned warehouse'
  end
end