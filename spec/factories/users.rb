# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "cam@inspiredo.com"
    password "camcam"
    password_confirmation "camcam"
    is_student false
    is_mentor true
  end

  factory :mentor, class: User do
    email "scott@inspiredo.com"
    password "camcam"
    is_student false
    is_mentor true    
  end

  factory :student, class: User do
    email "student@inspiredo.com"
    password "camcam"
    password_confirmation "camcam"
    is_student true
    is_mentor false
  end
end
