class UserMailer < ApplicationMailer
logger           = ActiveSupport::Logger.new(STDOUT)
  default from: 'reception@ruby-hotel.com'

  def welcome_email(user)
	warn("[ERROR] >>> Entering welcome_email(user=#{user})")
    @user = user
    @url  = 'http://localhost:3000/login'
	warn("[WARN] <<< Exiting welcome_email(user=#{user})")
    mail(to: @user.email, subject: 'Welcome to Ruby Hotel Site')
  end
end
