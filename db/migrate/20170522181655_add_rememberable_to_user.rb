class AddRememberableToUser < ActiveRecord::Migration[5.1]
logger           = ActiveSupport::Logger.new(STDOUT)
  def self.up
	warn("[DEBUG] >>> Entering up()")
    change_table :users do |t|
      ## Rememberable
      t.datetime :remember_created_at
	warn("[DEBUG] <<< Exiting up()")
    end
  end

  def self.down
	warn("[DEBUG] >>> Entering down()")
	warn("[DEBUG] <<< Exiting down()")
    raise ActiveRecord::IrreversibleMigration
  end
end
