class CreateContacts < ActiveRecord::Migration[5.1]
logger           = ActiveSupport::Logger.new(STDOUT)
  def change
	warn("[ERROR] >>> Entering change()")
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.text :body
	warn("[WARN] <<< Exiting change()")
      t.timestamps
    end
  end
end
