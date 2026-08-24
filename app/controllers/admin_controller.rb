class AdminController < ApplicationController
logger           = ActiveSupport::Logger.new(STDOUT)
  before_action :require_admin

  def require_admin
	warn("[DEBUG] >>> Entering require_admin()")
    redirect_to contacts_path unless current_user.try(:admin)
  end
end
