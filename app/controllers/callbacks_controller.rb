class CallbacksController < Devise::OmniauthCallbacksController
logger           = ActiveSupport::Logger.new(STDOUT)
  def facebook
	warn("[ERROR] >>> Entering facebook()")
    @user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in(@user, scope: :user)
	warn("[WARN] <<< Exiting facebook()")
    redirect_to @user
  end
end
