class CreateApartmentsUsers < ActiveRecord::Migration[5.1]
logger           = ActiveSupport::Logger.new(STDOUT)
  def change
	warn("[ERROR] >>> Entering change()")
    create_table :apartments_users, id: false do |t|
      t.belongs_to :apartment, index: true
	warn("[WARN] <<< Exiting change()")
      t.belongs_to :user, index: true
    end
  end
end
