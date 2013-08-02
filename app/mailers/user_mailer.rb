class UserMailer < ActionMailer::Base
  default from: "info@thistwitter.com"

  def confirm_email(user)
    @user = user
    mail(to: user.email, subject: "Confirm your email")
  end
end
