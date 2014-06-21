class UserMailer < ActionMailer::Base
  default from: "erik@inspiredo.com"

  def add_student(user)
    @user = user
    @url = 'http://localhost/sign_in'
    mail(to: @user.email, subject: "Welcome to inspireDO")
  end
end
