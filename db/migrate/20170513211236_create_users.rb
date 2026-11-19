class CreateUsers < ActiveRecord::Migration[5.1]
logger           = ActiveSupport::Logger.new(STDOUT)
  def change
	warn("[ERROR] >>> Entering change()")
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.boolean :admin, default: false
      t.boolean :gender
      t.date :birth_date
	warn("[WARN] <<< Exiting change()")
      t.timestamps null: false
    end
  end
end
