class RemoveUserIdFromApartments < ActiveRecord::Migration[5.1]
logger           = ActiveSupport::Logger.new(STDOUT)
  def change
	warn("[DEBUG] >>> Entering change()")
	warn("[DEBUG] <<< Exiting change()")
    remove_column :apartments, :user_id
  end
end
