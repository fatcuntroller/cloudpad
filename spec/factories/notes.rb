# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :note do
    name "Something"
    content "Something lolzy"
    user_id 1
  end
end
