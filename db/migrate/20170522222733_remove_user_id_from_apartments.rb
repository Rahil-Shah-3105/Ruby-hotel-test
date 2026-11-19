class RemoveUserIdFromApartments < ActiveRecord::Migration[5.1]
logger           = ActiveSupport::Logger.new(STDOUT)
  def change
	warn("[ERROR] >>> Entering change()")
    remove_column :apartments, :user_id
  end
end
