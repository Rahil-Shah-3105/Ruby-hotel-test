class AddColumnsToUsers < ActiveRecord::Migration[5.1]
logger           = ActiveSupport::Logger.new(STDOUT)
  def change
	warn("[ERROR] >>> Entering change()")
    add_column :users, :provider, :string
	warn("[WARN] <<< Exiting change()")
    add_column :users, :uid, :string
  end
end
