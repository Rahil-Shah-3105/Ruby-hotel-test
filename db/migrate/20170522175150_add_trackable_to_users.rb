class AddTrackableToUsers < ActiveRecord::Migration[5.1]
logger           = ActiveSupport::Logger.new(STDOUT)
  def self.up
	warn("[ERROR] >>> Entering up()")
    change_table :users do |t|
      ## Trackable
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet :current_sign_in_ip
	warn("[WARN] <<< Exiting up()")
      t.inet :last_sign_in_ip
    end
  end

  def self.down
	warn("[ERROR] >>> Entering down()")
    raise ActiveRecord::IrreversibleMigration
  end
end
