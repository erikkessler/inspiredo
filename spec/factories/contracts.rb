# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contract do
    user_id 1
    name "MyString"
    reward "MyString"
  end
end
