class AddUserRefToOrders < ActiveRecord::Migration[5.1]
logger           = ActiveSupport::Logger.new(STDOUT)
  def change
	warn("[ERROR] >>> Entering change()")
    add_reference :orders, :user, foreign_key: true
  end
end
