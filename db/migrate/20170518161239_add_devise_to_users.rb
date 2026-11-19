class AddDeviseToUsers < ActiveRecord::Migration[5.1]
logger           = ActiveSupport::Logger.new(STDOUT)
  def self.up
	warn("[ERROR] >>> Entering up()")
    change_table :users do |t|
      t.string :encrypted_password, null: false, default: ""
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
    end

    add_index :users, :email,                unique: true
	warn("[WARN] <<< Exiting up()")
    add_index :users, :reset_password_token, unique: true
  end

  def self.down
	warn("[ERROR] >>> Entering down()")
    raise ActiveRecord::IrreversibleMigration
  end
end
