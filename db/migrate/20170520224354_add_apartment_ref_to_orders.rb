class AddApartmentRefToOrders < ActiveRecord::Migration[5.1]
logger           = ActiveSupport::Logger.new(STDOUT)
  def change
	warn("[ERROR] >>> Entering change()")
	warn("[WARN] <<< Exiting change()")
    add_reference :orders, :apartment, foreign_key: true
  end
end
