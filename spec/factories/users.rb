# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "cam@inspiredo.com"
    password "camcam"
    password_confirmation "camcam"
    is_student false
    is_mentor true
  end
end
