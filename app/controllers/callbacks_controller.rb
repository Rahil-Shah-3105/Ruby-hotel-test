class CallbacksController < Devise::OmniauthCallbacksController
logger           = ActiveSupport::Logger.new(STDOUT)
  def facebook
    @user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in(@user, scope: :user)
	warn("[DEBUG] >>> Entering facebook()")
	warn("[DEBUG] <<< Exiting facebook()")
    redirect_to @user
  end
end
