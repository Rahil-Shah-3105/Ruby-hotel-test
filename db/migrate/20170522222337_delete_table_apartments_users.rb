class DeleteTableApartmentsUsers < ActiveRecord::Migration[5.1]
logger           = ActiveSupport::Logger.new(STDOUT)
  def change
	warn("[ERROR] >>> Entering change()")
	warn("[WARN] <<< Exiting change()")
    drop_table :apartments_users
  end
end
