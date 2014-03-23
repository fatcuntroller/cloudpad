# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name                   "Testuser"
    uid                    "0"
    provider               "identity"
  end
end
