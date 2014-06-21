class UserMailer < ActionMailer::Base
  default from: "erik@inspiredo.com"

  def add_student(user, mentor)
    @mentor = mentor
    @user = user
    @url = 'http://localhost:3000/sign_in'
    mail(to: @user.email, subject: "Welcome to inspireDO")
  end

  def add_existing_student(user, mentor)
    @mentor = mentor
    @user = user
    @url = 'http://localhost:3000/sign_in'
    mail(to: @user.email, subject: "inspireDo: #{mentor} is now a mentor")
  end
end
