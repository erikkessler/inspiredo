# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feed_item do
    content "Completed 30'"
    user nil
  end
end
