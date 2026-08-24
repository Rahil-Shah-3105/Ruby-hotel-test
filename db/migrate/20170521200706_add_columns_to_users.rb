class AddColumnsToUsers < ActiveRecord::Migration[5.1]
logger           = ActiveSupport::Logger.new(STDOUT)
  def change
	warn("[DEBUG] >>> Entering change()")
    add_column :users, :provider, :string
	warn("[DEBUG] <<< Exiting change()")
    add_column :users, :uid, :string
  end
end
