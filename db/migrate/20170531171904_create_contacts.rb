class CreateContacts < ActiveRecord::Migration[5.1]
logger           = ActiveSupport::Logger.new(STDOUT)
  def change
	warn("[DEBUG] >>> Entering change()")
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.text :body
      t.timestamps
	warn("[DEBUG] <<< Exiting change()")
    end
  end
end
