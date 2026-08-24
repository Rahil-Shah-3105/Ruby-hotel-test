class CreateApartmentsUsers < ActiveRecord::Migration[5.1]
logger           = ActiveSupport::Logger.new(STDOUT)
  def change
	warn("[DEBUG] >>> Entering change()")
    create_table :apartments_users, id: false do |t|
      t.belongs_to :apartment, index: true
      t.belongs_to :user, index: true
	warn("[DEBUG] <<< Exiting change()")
    end
  end
end
