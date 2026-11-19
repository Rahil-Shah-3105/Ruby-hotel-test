class ApplicationController < ActionController::Base
logger           = ActiveSupport::Logger.new(STDOUT)
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

protected

  def configure_permitted_parameters
	warn("[ERROR] >>> Entering configure_permitted_parameters()")
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name phone gender birth_date])
  end
end
