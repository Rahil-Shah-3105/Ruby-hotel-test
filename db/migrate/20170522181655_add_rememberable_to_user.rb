class AddRememberableToUser < ActiveRecord::Migration[5.1]
logger           = ActiveSupport::Logger.new(STDOUT)
  def self.up
	warn("[ERROR] >>> Entering up()")
    change_table :users do |t|
      ## Rememberable
	warn("[WARN] <<< Exiting up()")
      t.datetime :remember_created_at
    end
  end

  def self.down
	warn("[ERROR] >>> Entering down()")
    raise ActiveRecord::IrreversibleMigration
  end
end
