# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :identity do
    name                   "FooBar"
    email                  "user@example.com"
    password               "password"
    password_confirmation  "password"
  end
end
